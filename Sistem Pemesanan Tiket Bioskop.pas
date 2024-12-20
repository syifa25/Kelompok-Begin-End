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

procedure PesanKursi;
var
  baris, kolom: integer;
begin
  write('Masukkan nomor baris (1-', MAX_BARIS, '): '); readln(baris);
  write('Masukkan nomor kolom (1-', MAX_KOLOM, '): '); readln(kolom);
  
  if ApakahTersedia(baris, kolom) then
  begin
    write('Masukkan nama pemesan: '); 
    readln(Bioskop[baris, kolom].NamaPemesan);
    Bioskop[baris, kolom].Status := 'B'; 
    writeln('Kursi berhasil dipesan!');
  end
  else
    writeln('Kursi sudah dipesan. Pilih kursi lain.');
end;

procedure BatalkanKursi;
var
  baris, kolom: integer;
begin
  write('Masukkan nomor baris (1-', MAX_BARIS, '): '); readln(baris);
  write('Masukkan nomor kolom (1-', MAX_KOLOM, '): '); readln(kolom);
if not ApakahTersedia(baris, kolom) then
  begin
    Bioskop[baris, kolom].Status := 'A'; // Ubah status menjadi available
    Bioskop[baris, kolom].NamaPemesan := '';
    writeln('Pemesan kursi berhasil dibatalkan.');
  end
  else
    writeln('Kursi belum dipesan.');
end;

procedure MenuUtama;
var
  pilihan: integer;
begin
  repeat
    clrscr;
    writeln('Sistem Pemesanan Tiket Bioskop');
    writeln('1. Tampilkan Layout Kursi');
    writeln('2. Pesan Kursi');
    writeln('3. Batalkan Pemesanan');
    writeln('4. Hitung Kursi yang Sudah Dipesan');
    writeln('5. Keluar');
    writeln('Pilih menu: ');
    readln(pilihan);
  case pilihan of
      1: TampilkanKursi;
      2: PesanKursi;
      3: BatalkanKursi;
      4: writeln('Total kursi yang sudah dipesan: ', HitungKursiDipesan);
      5: writeln('Terima kasih telah menggunakan sistem.');
    else
      writeln('Pilihan tidak valid.');
    end;
    if (pilihan <> 5) then
    begin
      writeln('Tekan Enter untuk kembali ke menu...');
      readln;
    end;
  until pilihan = 5;
end;

begin
  InisialisasiKursi;
  MenuUtama;
end.
