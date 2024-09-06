v 1. Update tampilan Trade Histories, Buy, Sell, Devden
v 2. Update Tampilkan Awal Portofolio
v 3. Update Histori Dana

------------

List issue
v 4. topup dana biasa tidak mempengaruhi yield, harga unit cuma mempengaruhi jumlah unit

v 5. ⁠bagian jual saham belum bener,
v jumlah Volume belum benar setelah beli

v 6. ⁠average di buying price belum b
ener

v 7. ⁠dibagian dana itu seperti yang sebelumnya menampilksn topup dana berapa, harga unit berspa, jumlah unit berapa dan total balancenya

v 8. ⁠untuk bagian histori nanti seperti sebelumnya ajak masden cuma menampilkan tanggal, volume, current price, total harga, sekuritas dan action jual atu beli

v 12. Qty Sell masih salah, tidak sesuai dengan yang di input
v 13. Sisa volume ketika jual masih salah, kemungkinan getSisaVolumetErakhirnya blm benar, qty volume kadang2 tiba2 jadi +

v 11. Yield kyknya masih salah, perlu dicek lagi

-------------

10. Topup Deposito Saham
    - form
    - history
    price dan bank,
14. Setup VPS


    topup(
      date: DateTime(2024, 05, 01),
      amount: 10000000,
      type: TopupType.buyDeposito,
    );


15. Topup Deviden Deposito Bisa Milih BANK yang sudah ada sebelumnya

16. Jika belum pernah BUY dengan BANK X,maka belum bisa Topup DEPOSITO

17. Topup Saham hanya memunculkan sama yang kita punya
(Volume > 0)