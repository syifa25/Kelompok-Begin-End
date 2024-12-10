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

procedure InisialisasiKursi;
var
  i, j: integer;
begin
  for i := 1 to MAX_BARIS do
    for j := 1 to MAX_KOLOM do
    begin
      Bioskop[i, j].Status := 'A'; // Semua kursi awalnya tersedia
      Bioskop[i, j].NamaPemesan := '';
    end;
end;

begin
  InisialisasiKursi;
  MenuUtama;
end.
