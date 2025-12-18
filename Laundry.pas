program LaundryManagement;

const
    MaksBaris = 100; { Batas maksimum baris matriks }
    MaksKolom = 9;    { Jumlah atribut dalam sistem laundry }

type
    MatriksLaundry = array[1..MaksBaris, 1..MaksKolom] of integer;

var
    DataLaundry: MatriksLaundry;
    JumlahBaris: integer;
    Pilih, PilihPengurutan, PilihBubble, PilihSelection, PilihSelectionMax, PilihSelectionMin, PilihCari: integer;
    IDHapus, DataCari: integer;

procedure MenuUtama(var Pilih: integer);
begin
    writeln('===== MENU UTAMA =====');
    writeln('1. Input Data         ');
    writeln('2. Tampilkan Data     ');
    writeln('3. Penghapusan Data   ');
    writeln('4. Pengurutan Data    ');
    writeln('5. Pencarian Data     ');
    writeln('6. Penghancuran Data  ');
    writeln('7. Penambahan Data    ');
    writeln('0. Keluar             ');
    writeln('======================');
    readln(Pilih);

    while (Pilih < 0) or (Pilih > 7) do
    begin
        writeln('Input tidak valid! Masukkan angka sesuai menu!');
        readln(Pilih);
    end;
end;

procedure MenuPengurutan(var PilihPengurutan: integer);
begin
    writeln('===== MENU PENGURUTAN =====');
    writeln('1. Bubble Sort             ');
    writeln('2. Selection Sort          ');
    writeln('===========================');
    readln(PilihPengurutan);

    while (PilihPengurutan < 1) or (PilihPengurutan > 2) do
    begin
        writeln('Input tidak valid! Masukkan angka sesuai menu!');
        readln(PilihPengurutan);
    end;
end;

procedure MenuBubbleSort(var PilihBubble: integer);
begin
    writeln('===== MENU BUBBLE SORT =====');
    writeln('1. Ascending                ');
    writeln('2. Descending               ');
    writeln('============================');
    readln(PilihBubble);

    while (PilihBubble < 1) or (PilihBubble > 2) do
    begin
        writeln('Input tidak valid! Masukkan angka sesuai menu!');
        readln(PilihBubble);
    end;
end;

procedure MenuSelectionSort(var PilihSelection: integer);
begin
    writeln('===== MENU SELECTION SORT =====');
    writeln('1. Maximum Sort                ');
    writeln('2. Minimum Sort                ');
    writeln('===============================');
    readln(PilihSelection);

    while (PilihSelection < 1) or (PilihSelection > 2) do
    begin
        writeln('Input tidak valid! Masukkan angka sesuai menu!');
        readln(PilihSelection);
    end;
end;

procedure MenuSelectionMax(var PilihSelectionMax: integer);
begin
    writeln('===== MENU MAXIMUM SORT =====');
    writeln('1. Ascending                 ');
    writeln('2. Descending                ');
    writeln('=============================');
    readln(PilihSelectionMax);

    while (PilihSelectionMax < 1) or (PilihSelectionMax > 2) do
    begin
        writeln('Input tidak valid! Masukkan angka sesuai menu!');
        readln(PilihSelectionMax);
    end;
end;

procedure MenuSelectionMin(var PilihSelectionMin: integer);
begin
    writeln('===== MENU MINIMUM SORT =====');
    writeln('1. Ascending                 ');
    writeln('2. Descending                ');
    writeln('=============================');
    readln(PilihSelectionMin);

    while (PilihSelectionMin < 1) or (PilihSelectionMin > 2) do
    begin
        writeln('Input tidak valid! Masukkan angka sesuai menu!');
        readln(PilihSelectionMin);
    end;
end;

procedure MenuPencarian(var PilihCari: integer);
begin
    writeln('===== MENU PENCARIAN =====');
    writeln('1. Sequential Search      ');
    writeln('2. Binary Search (ID unik)');
    writeln('==========================');
    readln(PilihCari);

    while (PilihCari < 1) or (PilihCari > 2) do
    begin
        writeln('Input tidak valid! Masukkan angka sesuai menu!');
        readln(PilihCari);
    end;
end;

procedure BuatMatriks(var DataLaundry: MatriksLaundry);
var
    i, j: integer;
begin
    for i := 1 to MaksBaris do
        for j := 1 to MaksKolom do
            DataLaundry[i, j] := 0;
end;

procedure TentukanTanggalAkhir(var DataLaundry: MatriksLaundry; i: integer);
var
    TglAwal, BlnAwal, Status, TglAkhir, BlnAkhir: integer;
    JumlahHari: array[1..12] of integer;
begin
    TglAwal := DataLaundry[i, 4];
    BlnAwal := DataLaundry[i, 5];
    Status := DataLaundry[i, 3];

    JumlahHari[1] := 31; JumlahHari[2] := 28; JumlahHari[3] := 31;
    JumlahHari[4] := 30; JumlahHari[5] := 31; JumlahHari[6] := 30;
    JumlahHari[7] := 31; JumlahHari[8] := 31; JumlahHari[9] := 30;
    JumlahHari[10] := 31; JumlahHari[11] := 30; JumlahHari[12] := 31;

    if Status = 0 then
        TglAkhir := TglAwal + 7
    else
        TglAkhir := TglAwal + 1;

    if TglAkhir > JumlahHari[BlnAwal] then
    begin
        TglAkhir := TglAkhir - JumlahHari[BlnAwal];
        BlnAkhir := BlnAwal + 1;
        if BlnAkhir > 12 then
            BlnAkhir := 1; // Reset to January
    end
    else
        BlnAkhir := BlnAwal;

    DataLaundry[i, 6] := TglAkhir;
    DataLaundry[i, 7] := BlnAkhir;
end;

procedure HitungHarga(var DataLaundry: MatriksLaundry; i: integer);
var
    Berat, Status, Harga: integer;
begin
    Berat := DataLaundry[i, 2];
    Status := DataLaundry[i, 3];

    if Status = 0 then
        Harga := Berat * 6000
    else
        Harga := Berat * 10000;

    DataLaundry[i, 8] := Harga;
end;

procedure IsiMatriks(var DataLaundry: MatriksLaundry);
var
    i: integer;
    Berat, Status, TglAwal, BlnAwal: integer;
    InputNama: string;
begin
    i := 1;
    repeat
        writeln('Masukkan Nama (atau ''STOP'' untuk berhenti)                : ');
        readln(InputNama);
        
        if InputNama <> 'STOP' then
        begin
            writeln('Masukkan Berat (kg)                                     : ');
            readln(Berat);
            writeln('Masukkan Status (0: selesai seminggu, 1: selesai sehari): ');
            readln(Status);
            while(Status <> 0) and (Status <> 1)do
            begin
               writeln('Harap Masukkan Status 0 atau 1');
               readln(Status);
            end;
            write('Masukkan bulan (1-12): ');
            readln(BlnAwal);
  
            while (BlnAwal < 1) or (BlnAwal > 12) do
            begin
               writeln('Bulan harus antara 1-12!');
               write('Masukkan bulan kembali: ');
               readln(BlnAwal);
            end;

            { Validasi Tanggal Berdasarkan Bulan }
            write('Masukkan tanggal: ');
            readln(TglAwal);

            while ((BlnAwal = 2) and ((TglAwal < 1) or (TglAwal > 29))) or
            ((BlnAwal mod 2 = 1) and ((TglAwal < 1) or (TglAwal > 31))) or
            ((BlnAwal mod 2 = 0) and ((TglAwal < 1) or (TglAwal > 30))) do
            begin
               writeln('Tanggal tidak valid untuk bulan ', BlnAwal, '!');
               write('Masukkan tanggal kembali: ');
               readln(TglAwal);
            end;
            
            DataLaundry[i, 1] := i;  { ID otomatis }
            DataLaundry[i, 2] := Berat;
            DataLaundry[i, 3] := Status;
            DataLaundry[i, 4] := TglAwal;
            DataLaundry[i, 5] := BlnAwal;
            
            TentukanTanggalAkhir(DataLaundry, i);
            HitungHarga(DataLaundry, i);
            
            i := i + 1;
        end;
    until InputNama = 'STOP';
    JumlahBaris := i - 1;  { Update jumlah baris }
end;

procedure TambahData(var DataLaundry: MatriksLaundry;var JumlahBaris: integer);
var
   Berat, Status, TglAwal, BlnAwal: integer;
   InputNama: string;
begin
  if(JumlahBaris < MaksBaris) then
  begin
     JumlahBaris := JumlahBaris + 1;
     writeln('Masukkan Nama                                           : ');
     readln(InputNama);
     writeln('Masukkan Berat (kg)                                     : ');
     readln(Berat);
     writeln('Masukkan Status (0: selesai seminggu, 1: selesai sehari): ');
     readln(Status);
     while(Status <> 0) and (Status <> 1)do
     begin
        writeln('Harap Masukkan Status 0 atau 1');
        readln(Status);
     end;
     write('Masukkan bulan (1-12): ');
     readln(BlnAwal);
  
     while (BlnAwal < 1) or (BlnAwal > 12) do
     begin
        writeln('Bulan harus antara 1-12!');
        write('Masukkan bulan kembali: ');
        readln(BlnAwal);
     end;

     { Validasi Tanggal Berdasarkan Bulan }
     write('Masukkan tanggal: ');
     readln(TglAwal);

     while ((BlnAwal = 2) and ((TglAwal < 1) or (TglAwal > 29))) or
     ((BlnAwal mod 2 = 1) and ((TglAwal < 1) or (TglAwal > 31))) or
     ((BlnAwal mod 2 = 0) and ((TglAwal < 1) or (TglAwal > 30))) do
     begin
        writeln('Tanggal tidak valid untuk bulan ', BlnAwal, '!');
        write('Masukkan tanggal kembali: ');
        readln(TglAwal);
     end;
            
     DataLaundry[JumlahBaris, 1] := JumlahBaris;  { ID otomatis }
     DataLaundry[JumlahBaris, 2] := Berat;
     DataLaundry[JumlahBaris, 3] := Status;
     DataLaundry[JumlahBaris, 4] := TglAwal;
     DataLaundry[JumlahBaris, 5] := BlnAwal;
            
     TentukanTanggalAkhir(DataLaundry, JumlahBaris);
     HitungHarga(DataLaundry, JumlahBaris);
   end;
end;

procedure TampilkanData(var DataLaundry: MatriksLaundry);
var
    i: integer;
begin
    for i := 1 to JumlahBaris do
    begin
        if DataLaundry[i, 1] <> 0 then
        begin
            writeln('============================');
            writeln('ID: ', DataLaundry[i, 1]);
            writeln('Berat: ', DataLaundry[i, 2], ' kg');
            writeln('Status: ', DataLaundry[i, 3]);
            writeln('Tanggal Awal: ', DataLaundry[i, 4], '/', DataLaundry[i, 5]);
            writeln('Tanggal Akhir: ', DataLaundry[i, 6], '/', DataLaundry[i, 7]);
            writeln('Harga: Rp', DataLaundry[i, 8]);
            writeln('============================');
        end;
    end;
end;

procedure HapusData(var DataLaundry: MatriksLaundry; IDHapus: integer);
var
    i, j: integer;
    found: boolean;
begin
    found := false;
    for i := 1 to MaksBaris do
    begin
        if DataLaundry[i, 1] = IDHapus then
        begin
            for j := 1 to MaksKolom do
                DataLaundry[i, j] := 0;
            writeln('Data berhasil dihapus');
            found := true;
            break;
        end;
    end;
    if not found then
        writeln('ID tidak ditemukan.');
end;

procedure BubbleSortAsc(var DataLaundry: MatriksLaundry; JumlahBaris: integer);
var
    i, j, k: integer;
    temp: integer;
begin
    for i := 1 to JumlahBaris - 1 do
        for j := 1 to JumlahBaris - i do
            if DataLaundry[j, 2] > DataLaundry[j + 1, 2] then
            begin
                for k := 1 to MaksKolom do
                begin
                    temp := DataLaundry[j, k];
                    DataLaundry[j, k] := DataLaundry[j + 1, k];
                    DataLaundry[j + 1, k] := temp;
                end;
            end;
end;

procedure BubbleSortDesc(var DataLaundry: MatriksLaundry; JumlahBaris: integer);
var
    i, j, k: integer;
    temp: integer;
begin
    for i := 1 to JumlahBaris - 1 do
        for j := 1 to JumlahBaris - i do
            if DataLaundry[j, 2] < DataLaundry[j + 1, 2] then
            begin
                for k := 1 to MaksKolom do
                begin
                    temp := DataLaundry[j, k];
                    DataLaundry[j, k] := DataLaundry[j + 1, k];
                    DataLaundry[j + 1, k] := temp;
                end;
            end;
end;

procedure SelectionSortMaxAsc(var DataLaundry: MatriksLaundry; JumlahBaris: integer);
var
    i, j, k, idxMax: integer;
    temp: integer;
begin
    for i := 1 to JumlahBaris - 1 do
    begin
        idxMax := i;
        for j := i + 1 to JumlahBaris do
            if DataLaundry[j, 8] < DataLaundry[idxMax, 8] then
                idxMax := j;
        if idxMax <> i then
        begin
            for k := 1 to MaksKolom do
            begin
                temp := DataLaundry[i, k];
                DataLaundry[i, k] := DataLaundry[idxMax, k];
                DataLaundry[idxMax, k] := temp;
            end;
        end;
    end;
end;

procedure SelectionSortMaxDesc(var DataLaundry: MatriksLaundry; JumlahBaris: integer);
var
    i, j, k, idxMax: integer;
    temp: integer;
begin
    for i := 1 to JumlahBaris - 1 do
    begin
        idxMax := i;
        for j := i + 1 to JumlahBaris do
            if DataLaundry[j, 8] > DataLaundry[idxMax, 8] then
                idxMax := j;

        for k := 1 to MaksKolom do
        begin
            temp := DataLaundry[i, k];
            DataLaundry[i, k] := DataLaundry[idxMax, k];
            DataLaundry[idxMax, k] := temp;
        end;
    end;
end;

procedure SelectionSortMinAsc(var DataLaundry: MatriksLaundry; JumlahBaris: integer);
var
    i, j, k, idxMin: integer;
    temp: integer;
begin
    for i := 1 to JumlahBaris - 1 do
    begin
        idxMin := i;
        for j := i + 1 to JumlahBaris do
            if DataLaundry[j, 8] < DataLaundry[idxMin, 8] then
                idxMin := j;

        for k := 1 to MaksKolom do
        begin
            temp := DataLaundry[i, k];
            DataLaundry[i, k] := DataLaundry[idxMin, k];
            DataLaundry[idxMin, k] := temp;
        end;
    end;
end;

procedure SelectionSortMinDesc(var DataLaundry: MatriksLaundry; JumlahBaris: integer);
var
    i, j, k, idxMin: integer;
    temp: integer;
begin
    for i := 1 to JumlahBaris - 1 do
    begin
        idxMin := i;
        for j := i + 1 to JumlahBaris do
            if DataLaundry[j, 8] > DataLaundry[idxMin, 8] then
                idxMin := j;

        for k := 1 to MaksKolom do
        begin
            temp := DataLaundry[i, k];
            DataLaundry[i, k] := DataLaundry[idxMin, k];
            DataLaundry[idxMin, k] := temp;
        end;
    end;
end;

procedure SequentialSearch(var DataLaundry: MatriksLaundry; MaksBaris: integer; DataCari: integer);
var
    i: integer;
    ditemukan: boolean;
begin
    ditemukan := false;
    for i := 1 to MaksBaris do
    begin
        if DataLaundry[i, 3] = DataCari then
        begin
            ditemukan := true;
            writeln('Data ditemukan:');
            writeln('ID: ', DataLaundry[i, 1], ' | Berat: ', DataLaundry[i, 2], ' kg | Status: ', DataLaundry[i, 3], 
                    ' | Tgl Awal : ', DataLaundry[i, 4], '/', DataLaundry[i, 5],
                    ' | Tgl Akhir: ', DataLaundry[i, 6], '/', DataLaundry[i, 7], 
                    ' | Harga    : Rp', DataLaundry[i, 8]);
        end;
    end;

    if not ditemukan then
        writeln('Data tidak ditemukan.');
end;

procedure BinarySearch(var DataLaundry: MatriksLaundry; JumlahBaris: integer; DataCari: integer);
var
    la, lb, mid: integer;
    ditemukan: boolean;
begin
    la := 1;
    lb := JumlahBaris;
    ditemukan := false;

    while (la <= lb) and (not ditemukan) do
    begin
        mid := (la + lb) div 2;

        if DataLaundry[mid, 1] = DataCari then
        begin
            ditemukan := true;
            writeln('Data ditemukan: ', DataLaundry[mid, 1], ' ', DataLaundry[mid, 2], ' ', DataLaundry[mid, 3]);
        end
        else if DataLaundry[mid, 1] < DataCari then
            la := mid + 1
        else
            lb := mid - 1;
    end;

    if not ditemukan then
        writeln('Data tidak ditemukan!');
end;

procedure Penghancuran(var DataLaundry: MatriksLaundry; var JumlahBaris: integer);
var
    i, j: integer;
begin
    for i := 1 to JumlahBaris do
        for j := 1 to MaksKolom do
            DataLaundry[i, j] := 0;

    JumlahBaris := 0;  { Mengosongkan jumlah baris agar tidak ada data yang tersisa }
    writeln('Semua data telah dihapus.');
end;

begin
    BuatMatriks(DataLaundry);
    JumlahBaris := 0;  { Inisialisasi jumlah baris }

    MenuUtama(Pilih);

    while (Pilih <> 0) do
    begin
        case Pilih of
            1: IsiMatriks(DataLaundry);
            2: TampilkanData(DataLaundry);
            3: 
            begin
                writeln('Masukkan ID yang akan dihapus: ');
                readln(IDHapus);
                HapusData(DataLaundry, IDHapus);
            end;
            4: 
            begin
                MenuPengurutan(PilihPengurutan);
                case PilihPengurutan of
                    1: 
                    begin
                        MenuBubbleSort(PilihBubble);
                        case PilihBubble of
                            1:
                            begin
                              BubbleSortAsc(DataLaundry, JumlahBaris);
                              writeln('Data telah diurutkan secara Ascending berdasarkan Berat.');
                              TampilkanData(DataLaundry);
                            end;
                            2:
                            begin
                              BubbleSortDesc(DataLaundry, JumlahBaris);
                              writeln('Data telah diurutkan secara Descending berdasarkan Berat.');
                              TampilkanData(DataLaundry);
                            end;
                        end;
                    end;
                    2: 
                    begin
                        MenuSelectionSort(PilihSelection);
                        case PilihSelection of
                            1: 
                            begin
                                MenuSelectionMax(PilihSelectionMax);
                                case PilihSelectionMax of
                                    1:
                                    begin
                                      SelectionSortMaxAsc(DataLaundry, JumlahBaris);
                                      writeln('Data telah diurutkan secara Ascending berdasarkan Harga.');
                                      TampilkanData(DataLaundry);
                                    end;
                                    2:
                                    begin
                                         SelectionSortMaxDesc(DataLaundry, JumlahBaris);
                                         writeln('Data telah diurutkan secara Descending berdasarkan Harga.');
                                         TampilkanData(DataLaundry);
                                    end;
                                end;
                            end;
                            2: 
                            begin
                                MenuSelectionMin(PilihSelectionMin);
                                case PilihSelectionMin of
                                    1:
                                    begin
                                      SelectionSortMinAsc(DataLaundry, JumlahBaris);
                                      writeln('Data telah diurutkan secara Ascending berdasarkan Harga.');
                                      TampilkanData(DataLaundry);
                                    end;
                                    2:
                                    begin
                                      SelectionSortMinDesc(DataLaundry, JumlahBaris);
                                      writeln('Data telah diurutkan secara Descending berdasarkan Harga.');
                                      TampilkanData(DataLaundry);
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            5: 
            begin
                MenuPencarian(PilihCari);
                case PilihCari of
                    1: 
                    begin
                        writeln('Masukkan data yang ingin dicari berdasarkan status(0/1): ');
                        readln(DataCari);
                        SequentialSearch(DataLaundry, JumlahBaris, DataCari);
                    end;
                    2: 
                    begin
                        writeln('Masukkan ID yang ingin dicari: ');
                        readln(DataCari);
                        BinarySearch(DataLaundry, JumlahBaris, DataCari);
                    end;
                end;
            end;
            6: Penghancuran(DataLaundry, JumlahBaris);
            7: TambahData(DataLaundry,JumlahBaris);
        end;

        MenuUtama(Pilih);
    end;
end.
