# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_07_101022) do

  create_table "appointments", charset: "utf8mb4", force: :cascade do |t|
    t.string "noRM"
    t.date "bookingDate"
    t.string "policlinicID"
    t.string "doctorID"
    t.string "paymentID"
    t.string "bookingCode"
    t.string "queueNumber"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cancel"
  end

  create_table "jakis", charset: "utf8mb4", force: :cascade do |t|
    t.string "noRM"
    t.string "name"
    t.string "birthDate"
    t.string "nik"
    t.string "sex"
    t.string "noJKN"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rawat_jalan_apms", charset: "utf8mb4", force: :cascade do |t|
    t.string "mrn"
    t.date "tglSJP"
    t.string "jaminan"
    t.string "jnsPelayanan"
    t.string "namaPeserta"
    t.string "bookingCode"
    t.string "queueNumber"
    t.string "diagnosa"
    t.string "informasi"
    t.string "kelasRawat"
    t.string "noRujukan"
    t.string "noSep"
    t.string "penjamin"
    t.string "poli"
    t.string "poliEksekutif"
    t.string "tglSep"
    t.string "asuransi"
    t.string "hakKelas"
    t.string "jnsPeserta"
    t.string "kelamin"
    t.string "noKartu"
    t.string "noMr"
    t.string "tglLahir"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rawat_jalan_onsites", charset: "utf8mb4", force: :cascade do |t|
    t.string "noRM"
    t.date "visitDate"
    t.string "policlinicID"
    t.string "doctorID"
    t.string "paymentID"
    t.string "noJKN"
    t.string "kodeJenisPeserta"
    t.string "jenisPeserta"
    t.string "noSEP"
    t.string "noRujukan"
    t.string "kodePPK"
    t.string "kodeDiag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
