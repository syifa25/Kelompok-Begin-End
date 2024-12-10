program SistemPemesananTiketBioskop;

uses crt;

const
  MAX_BARIS = 5;
  MAX_KOLOM = 5;

type
  TKursi = record
    Status: char; // 'A' untuk Available, 'B' untuk Booked
    NamaPemesan: string;
  end;

var
  Bioskop: array[1..MAX_BARIS, 1..MAX_KOLOM] of TKursi;


begin
  InisialisasiKursi;
  MenuUtama;
end.
