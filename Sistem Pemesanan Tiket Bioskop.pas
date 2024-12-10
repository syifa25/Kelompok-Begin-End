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

function ApakahTersedia(baris, kolom: integer): boolean;
begin
  if (Bioskop[baris, kolom].Status = 'A') then
    ApakahTersedia := true
  else
    ApakahTersedia := false;
end;

function HitungKursiDipesan: integer;
var
  i, j, jumlah: integer;
begin
  jumlah := 0;
  for i := 1 to MAX_BARIS do
    for j := 1 to MAX_KOLOM do
      if (Bioskop[i, j].Status = 'B') then
        inc(jumlah);
  HitungKursiDipesan := jumlah;
end;

procedure TampilkanKursi;
var
  i, j: integer;
begin
  writeln('Layout Kursi: (A = Available, B = Booked)');
  writeln('------------------------------------------');
  for i := 1 to MAX_BARIS do
  begin
    for j := 1 to MAX_KOLOM do
    begin
      write(Bioskop[i, j].Status, ' ');
    end;
    writeln;
  end;
  writeln('------------------------------------------');
end;

begin
  InisialisasiKursi;
  MenuUtama;
end.
