Untuk yang dikerjakan sekarang
1 ⁠sama notifikasinya masih gk mau
2 ⁠buatkan sinkronisasi offline gitu buat pencatatan keuangan
    pemasukan
    pengeluaran
    transaction-histories
    transaction-histories/categories
    kategori-pemasukan
    kategori-pengeluaran
    filter by category dan date-nya

    jika digunakan, kode get pemasukan/pengeluaran/etc by xxx perlu di update, agar mengambil data local

    1st time load
        -> get all data save to cache

    on update/delete/create
        -> check if there's create, update or delete
        -> sync to server (upload data to server)

    Server Side Update:
    - Get All Data
    - Sync Data

v 3 reset password
v 4 ⁠nyambungin API buat di current pricenya sama stocknya

--

5 ⁠kalo berubah tahun itu dia ke reset mutasi dananya dan memakai dana valuation akhir, harga unit yang terakhir buat nentuin jumlah unitnya



