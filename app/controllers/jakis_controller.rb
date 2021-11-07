class JakisController < ApplicationController
  before_action :set_jaki, only: %i[ show update destroy ]

  # GET /jakis
  # GET /jakis.json
  def index
    @jakis = Jaki.all
  end

  def jadwal_poli
    
  end

  def registrationrawatjalanCIK
    data = {
     bookingCode: params['bookingCode']
    }
    daftar = RawatJalanApm.new(data)

    if daftar.save
      find_apm = Appointment.find_by(bookingCode: params['bookingCode'])

      if find_apm['paymentID'] == 'BPJS' 
         mydata = {
          metaData: {code: 200 , message: "OK"},
          response: { 
            diagnosa: daftar['diagnosa'],
            informasi: daftar['informasi'],
            jnsPelayanan: daftar['jnsPelayanan'],
            kelasRawat: daftar['kelasRawat'],
            noRujukan: daftar['noRujukan'],
            noSep: daftar['noSep'],
            penjamin: daftar['penjamin'],
            peserta: {
              asuransi: daftar['asuransi'],
              hakKelas: daftar['hakKelas'],
              jnsPeserta: daftar['jnsPeserta'],
              kelamin: daftar['kelamin'],
              nama: daftar['nama'],
              noKartu: daftar['noKartu'],
              noMr: daftar['noMr'],
              tglLahir: daftar['tglLahir'],
            },
            poli: daftar['poli'],
            poliEksekutif: daftar['poliEksekutif'],
            tglSep: daftar['tglSep'],
          },
        }
      else
        mydata = {
          metaData: {code: 200 , message: "OK"},
          response: { 
            mrn:  daftar['mrn'],
            jaminan: daftar['jaminan'],
            tglSJP: daftar['tglSJP'],
            jnsPelayanan: daftar['jnsPelayanan'],
            namaPeserta: daftar['namaPeserta'],
            poli: daftar['poli']
           },
        }
      end
    else
      mydata = {
          metaData: {code: 400, message: "Bad Request, not saving data"}
        }
    end

    render json: mydata
    return

  end

  def registrationrawatjalan
    data = {
      noRM: params['noMR'],
      visitDate: params['visitDate'].to_date,
      policlinicID: params['policlinicID'],
      doctorID: params['doctorID'],
      paymentID: params['paymentID'],
      noJKN: params['noJKN'],
      kodeJenisPeserta: params['kodeJenisPeserta'],
      jenisPeserta: params['jenisPeserta'],
      noSEP: params['noSEP'],
      noRujukan: params['noRujukan'],
      kodePPK: params['kodePPK'],
      kodeDiag: params['kodeDiag']
    }
    daftar = RawatJalanOnsite.new(data)

    if daftar.save
      mydata = {
          metaData: {code: 201 , message: "Object created. Patient have been checked in"},
          response: { registration:  {registrationCode: "RJ#{daftar['visitDate'].strftime('%Y%m%d')}#{daftar['doctorID']}", queueNumber: daftar['kodeJenisPeserta']} },
        }
    else
      mydata = {
          metaData: {code: 400, message: "Bad Request, not saving data"}
        }
    end

    render json: mydata
    return
  end

  def appointmentsearch
    find_appointment = Appointment.where(noRM: params['noMR'])
    
    if find_appointment.present?
       searchDate = find_appointment.where("bookingDate BETWEEN '#{params['startDate'].to_date}' AND '#{params['endDate'].to_date}'")
        
       if searchDate.present?
        data = []
        searchDate.each do |res|
          datax = {
            bookingCode: res['bookingCode'],
            noMR: res['noRM'],
            bookingDate: res['bookingDate'],
            policlinicID: res['policlinicID'],
            doctorID: res['doctorID'],
            paymentID: res['paymentID'],
            queueNumber: res['queueNumber'],
            statusID: (res['cancel'] != nil ? res['cancel'] : 1 )
          }
          data.push(datax)
        end

        mydata = {
          metaData: {code: 200, message: "OK"},
          response: { appointment:  data },
        }
       else
        mydata = {
          metaData: {code: 404, message: "Not found. Appointment doesn't exist"},
        }
       end
    else
        mydata = {
          metaData: {code: 404, message: "Not found. Appointment doesn't exist"},
        }
    end

    render json: mydata
    return
   

  end
  
  def appointmentcancel
    find_appointment = Appointment.find_by(noRm: params['noMR'],bookingCode: params['bookingCode'])
   
    if find_appointment.present?
      data = {
        noRM: find_appointment['noRM'],
        bookingDate: find_appointment['bookingDate'],
        policlinicID: find_appointment['policlinicID'],
        doctorID: find_appointment['doctorID'],
        paymentID: find_appointment['paymentID'],
        bookingCode: find_appointment['bookingCode'],
        queueNumber: find_appointment['queueNumber'],
        cancel: '1'
      }
      if find_appointment.update(data)
         mydata = {
          metaData: {code: 200, message: "OK. 1 appointment(s) has been canceled  "},
        }
      else
         mydata = {
          metaData: {code: 404, message: "Not Update"},
        }
      end
    else
      mydata = {
          metaData: {code: 404, message: "Not found. Appointment doesn’t exist"},
        }
    end

    render json: mydata
    return
  end

  def appointment

    booking = params['bookingDate']
    input = {
      noRM: params['noRm'],
      bookingDate: booking.to_date,
      policlinicID: params['policlinicID'],
      doctorID: params['doctorID'],
      paymentID: params['paymentID'],
      bookingCode: params['bookingCode'],
      queueNumber: params['queueNumber']
    }
    data = Appointment.new(input)
    
    find_booking_date = Appointment.where("bookingDate = '#{booking.to_date}'").count()
    
    if find_booking_date > 1
       mydata = {
          metaData: {code: 403, message: "Today's appointment has exceeded the limit"}
        }
    else
       if data.save
        mydata = {
          metaData: {code: 201, message: "Object created. Appointment has been scheduled "},
          response: { appointment: {bookingCode: data['bookingCode'], queueNumber: data['queueNumber'] } },
        }
      else
        mydata = {
          metaData: {code: 400, message: "Bad request, Not saving data"}
        }
      end
    end

    render json: mydata
    return

  end

  def get_validasi
    @jakis = Jaki.find_by("noRM = #{params["noRM"]}")

    # data = []
    # @jakis.each do |res|
      datax = {
        noMR: @jakis['noRM'],
        name: @jakis['name'],
        sex: @jakis['sex'],
        birthDate: @jakis['birthDate'],
        nik: @jakis['nik'],
        noJKN: @jakis['noJKN'],
        phone: @jakis['phone']
      }
    #   data.push(datax)
    # end

     mydata = {
      metaData: @jakis.present? ? {code: 200, message: "OK"} : {code: 404, message: "Not Found,Patient doesn't exist"},
      response: { patient: datax },
    }

    if @jakis.present?
      res = {status: true,message:"OK",content: mydata}
    else
       res = {status: false,message:"Tidak ada Data"}
    end

    render json: res
    return
  end

  # GET /jakis/1
  # GET /jakis/1.json
  def show
  end

  # POST /jakis
  # POST /jakis.json
  def create
    @jaki = Jaki.new(jaki_params)

    if @jaki.save
      render :show, status: :created, location: @jaki
    else
      render json: @jaki.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jakis/1
  # PATCH/PUT /jakis/1.json
  def update
    if @jaki.update(jaki_params)
      render :show, status: :ok, location: @jaki
    else
      render json: @jaki.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jakis/1
  # DELETE /jakis/1.json
  def destroy
    @jaki.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jaki
      @jaki = Jaki.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jaki_params
      params.permit(:noRM, :name, :sex, :birthDate, :nik, :noJKN, :phone)
    end
end
