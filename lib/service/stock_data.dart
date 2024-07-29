// id_saham,nama_saham,nama_perusahaan,pic,buy_volume,sell_volume,buy_price,sell_price,current_price,buy_total,current_total,floating_return,fund_alloc,value_effect,sekuritas

String stockData = """
2,ABBA,Mahaka Media Tbk.,https://s3.goapi.io/logo/ABBA.jpg,3502,3502,3502,3502,3502,0,0,0,0,0,-
19,AGRS,Bank IBK Indonesia Tbk.,https://s3.goapi.io/logo/AGRS.jpg,3746,3746,3746,3746,3746,0,0,0,0,0,-
41,ANDI,Andira Agro Tbk.,https://s3.goapi.io/logo/ANDI.jpg,1579,1579,1579,1579,1579,0,0,0,0,0,-
48,APLN,Agung Podomoro Land Tbk.,https://s3.goapi.io/logo/APLN.jpg,2979,2979,2979,2979,2979,0,0,0,0,0,-
64,ASII,Astra International Tbk.,https://s3.goapi.io/logo/ASII.jpg,1351,1351,1351,1351,1351,0,0,0,0,0,-
106,BCAP,MNC Kapital Indonesia Tbk.,https://s3.goapi.io/logo/BCAP.jpg,3596,3596,3596,3596,3596,0,0,0,0,0,-
209,CLEO,Sariguna Primatirta Tbk.,https://s3.goapi.io/logo/CLEO.jpg,4079,4079,4079,4079,4079,0,0,0,0,0,-
212,CMNT,Cemindo Gemilang Tbk.,https://s3.goapi.io/logo/CMNT.jpg,2239,2239,2239,2239,2239,0,0,0,0,0,-
248,DIGI,Arkadia Digital Media Tbk.,https://s3.goapi.io/logo/DIGI.jpg,3171,3171,3171,3171,3171,0,0,0,0,0,-
252,DLTA,Delta Djakarta Tbk.,https://s3.goapi.io/logo/DLTA.jpg,4931,4931,4931,4931,4931,0,0,0,0,0,-
296,EXCL,XL Axiata Tbk.,https://s3.goapi.io/logo/EXCL.jpg,2630,2630,2630,2630,2630,0,0,0,0,0,-
309,FORU,Fortune Indonesia Tbk,https://s3.goapi.io/logo/FORU.jpg,1057,1057,1057,1057,1057,0,0,0,0,0,-
310,FORZ,Forza Land Indonesia Tbk.,https://s3.goapi.io/logo/FORZ.jpg,3487,3487,3487,3487,3487,0,0,0,0,0,-
382,IFSH,Ifishdeco Tbk.,https://s3.goapi.io/logo/IFSH.jpg,3431,3431,3431,3431,3431,0,0,0,0,0,-
398,INDR,Indo-Rama Synthetics Tbk.,https://s3.goapi.io/logo/INDR.jpg,1526,1526,1526,1526,1526,0,0,0,0,0,-
516,MAGP,Multi Agro Gemilang Plantation Tbk.,https://s3.goapi.io/logo/MAGP.jpg,4490,4490,4490,4490,4490,0,0,0,0,0,-
651,PGAS,Perusahaan Gas Negara Tbk.,https://s3.goapi.io/logo/PGAS.jpg,3941,3941,3941,3941,3941,0,0,0,0,0,-
704,PURA,Putra Rajawali Kencana Tbk.,https://s3.goapi.io/logo/PURA.jpg,2946,2946,2946,2946,2946,0,0,0,0,0,-
741,SAPX,Satria Antaran Prima Tbk.,https://s3.goapi.io/logo/SAPX.jpg,2465,2465,2465,2465,2465,0,0,0,0,0,-
748,SCPI,Organon Pharma Indonesia Tbk.,https://s3.goapi.io/logo/SCPI.jpg,3338,3338,3338,3338,3338,0,0,0,0,0,-
754,SGER,Sumber Global Energy Tbk.,https://s3.goapi.io/logo/SGER.jpg,1465,1465,1465,1465,1465,0,0,0,0,0,-
800,SRSN,Indo Acidatama Tbk,https://s3.goapi.io/logo/SRSN.jpg,2796,2796,2796,2796,2796,0,0,0,0,0,-
844,TLDN,Teladan Prima Agro Tbk.,https://s3.goapi.io/logo/TLDN.jpg,4012,4012,4012,4012,4012,0,0,0,0,0,-
911,WINR,Winner Nusantara Jaya Tbk.,https://s3.goapi.io/logo/WINR.jpg,4466,4466,4466,4466,4466,0,0,0,0,0,-
89,BAPA,Bekasi Asri Pemula Tbk.,https://s3.goapi.io/logo/BAPA.jpg,3729,3729,3729,3729,3729,0,0,0,0,0,-
240,DEAL,Dewata Freightinternational Tbk.,https://s3.goapi.io/logo/DEAL.jpg,3345,3345,3345,3345,3345,0,0,0,0,0,-
314,FUTR,Lini Imaji Kreasi Ekosistem Tbk.,https://s3.goapi.io/logo/FUTR.jpg,4939,4939,4939,4939,4939,0,0,0,0,0,-
372,HYGN,Ecocare Indo Pasifik Tbk.,https://s3.goapi.io/logo/HYGN.jpg,1562,1562,1562,1562,1562,0,0,0,0,0,-
379,IDEA,Idea Indonesia Akademi Tbk.,https://s3.goapi.io/logo/IDEA.jpg,1965,1965,1965,1965,1965,0,0,0,0,0,-
599,MYRX,Hanson International Tbk.,https://s3.goapi.io/logo/MYRX.jpg,2318,2318,2318,2318,2318,0,0,0,0,0,-
36,AMIN,Ateliers Mecaniques D Indonesie Tbk.,https://s3.goapi.io/logo/AMIN.jpg,1382,1382,1382,1382,1382,0,0,0,0,0,-
320,GEMS,Golden Energy Mines Tbk.,https://s3.goapi.io/logo/GEMS.jpg,2704,2704,2704,2704,2704,0,0,0,0,0,-
558,MINA,Sanurhasta Mitra Tbk.,https://s3.goapi.io/logo/MINA.jpg,3212,3212,3212,3212,3212,0,0,0,0,0,-
10,ADHI,Adhi Karya (Persero) Tbk.,https://s3.goapi.io/logo/ADHI.jpg,3621,3621,3621,3621,3621,0,0,0,0,0,-
59,ARTO,Bank Jago Tbk.,https://s3.goapi.io/logo/ARTO.jpg,4673,4673,4673,4673,4673,0,0,0,0,0,-
544,MEGA,Bank Mega Tbk.,https://s3.goapi.io/logo/MEGA.jpg,3889,3889,3889,3889,3889,0,0,0,0,0,-
858,TPIA,Chandra Asri Petrochemical Tbk.,https://s3.goapi.io/logo/TPIA.jpg,2955,2955,2955,2955,2955,0,0,0,0,0,-
47,APLI,Asiaplast Industries Tbk.,https://s3.goapi.io/logo/APLI.jpg,1791,1791,1791,1791,1791,0,0,0,0,0,-
232,CTTH,Citatah Tbk.,https://s3.goapi.io/logo/CTTH.jpg,4787,4787,4787,4787,4787,0,0,0,0,0,-
679,POWR,Cikarang Listrindo Tbk.,https://s3.goapi.io/logo/POWR.jpg,4721,4721,4721,4721,4721,0,0,0,0,0,-
191,CASA,Capital Financial Indonesia Tbk.,https://s3.goapi.io/logo/CASA.jpg,1339,1339,1339,1339,1339,0,0,0,0,0,-
806,STAR,Buana Artha Anugerah Tbk.,https://s3.goapi.io/logo/STAR.jpg,2808,2808,2808,2808,2808,0,0,0,0,0,-
233,CUAN,Petrindo Jaya Kreasi Tbk.,https://s3.goapi.io/logo/CUAN.jpg,3545,3545,3545,3545,3545,0,0,0,0,0,-
356,HELI,Jaya Trishindo Tbk.,https://s3.goapi.io/logo/HELI.jpg,3481,3481,3481,3481,3481,0,0,0,0,0,-
628,OILS,Indo Oil Perkasa Tbk.,https://s3.goapi.io/logo/OILS.jpg,3323,3323,3323,3323,3323,0,0,0,0,0,-
705,PURE,Trinitan Metals and Minerals Tbk.,https://s3.goapi.io/logo/PURE.jpg,3586,3586,3586,3586,3586,0,0,0,0,0,-
76,AUTO,Astra Otoparts Tbk.,https://s3.goapi.io/logo/AUTO.jpg,1997,1997,1997,1997,1997,0,0,0,0,0,-
660,PLAN,Planet Properindo Jaya Tbk.,https://s3.goapi.io/logo/PLAN.jpg,4084,4084,4084,4084,4084,0,0,0,0,0,-
661,PLAS,Polaris Investama Tbk,https://s3.goapi.io/logo/PLAS.jpg,3555,3555,3555,3555,3555,0,0,0,0,0,-
812,SUPR,Solusi Tunas Pratama Tbk.,https://s3.goapi.io/logo/SUPR.jpg,2316,2316,2316,2316,2316,0,0,0,0,0,-
832,TELE,Omni Inovasi Indonesia Tbk.,https://s3.goapi.io/logo/TELE.jpg,3885,3885,3885,3885,3885,0,0,0,0,0,-
755,SGRO,Sampoerna Agro Tbk.,https://s3.goapi.io/logo/SGRO.jpg,4743,4743,4743,4743,4743,0,0,0,0,0,-
12,ADMG,Polychem Indonesia Tbk,https://s3.goapi.io/logo/ADMG.jpg,4271,4271,4271,4271,4271,0,0,0,0,0,-
83,BABY,Multitrend Indo Tbk.,https://s3.goapi.io/logo/BABY.jpg,1682,1682,1682,1682,1682,0,0,0,0,0,-
525,MARK,Mark Dynamics Indonesia Tbk.,https://s3.goapi.io/logo/MARK.jpg,3629,3629,3629,3629,3629,0,0,0,0,0,-
891,VAST,Vastland Indonesia Tbk.,https://s3.goapi.io/logo/VAST.jpg,1638,1638,1638,1638,1638,0,0,0,0,0,-
912,WINS,Wintermar Offshore Marine Tbk.,https://s3.goapi.io/logo/WINS.jpg,1082,1082,1082,1082,1082,0,0,0,0,0,-
827,TCID,Mandom Indonesia Tbk.,https://s3.goapi.io/logo/TCID.jpg,1045,1045,1045,1045,1045,0,0,0,0,0,-
894,VINS,Victoria Insurance Tbk.,https://s3.goapi.io/logo/VINS.jpg,2992,2992,2992,2992,2992,0,0,0,0,0,-
51,ARGO,Argo Pantes Tbk,https://s3.goapi.io/logo/ARGO.jpg,2495,2495,2495,2495,2495,0,0,0,0,0,-
725,RISE,Jaya Sukses Makmur Sentosa Tbk.,https://s3.goapi.io/logo/RISE.jpg,1357,1357,1357,1357,1357,0,0,0,0,0,-
846,TMAS,Temas Tbk.,https://s3.goapi.io/logo/TMAS.jpg,3850,3850,3850,3850,3850,0,0,0,0,0,-
282,ENRG,Energi Mega Persada Tbk.,https://s3.goapi.io/logo/ENRG.jpg,1375,1375,1375,1375,1375,0,0,0,0,0,-
187,CAMP,Campina Ice Cream Industry Tbk.,https://s3.goapi.io/logo/CAMP.jpg,4685,4685,4685,4685,4685,0,0,0,0,0,-
560,MITI,Mitra Investindo Tbk.,https://s3.goapi.io/logo/MITI.jpg,4699,4699,4699,4699,4699,0,0,0,0,0,-
907,WIFI,Solusi Sinergi Digital Tbk.,https://s3.goapi.io/logo/WIFI.jpg,4763,4763,4763,4763,4763,0,0,0,0,0,-
791,SONA,Sona Topas Tourism Industry Tbk.,https://s3.goapi.io/logo/SONA.jpg,2639,2639,2639,2639,2639,0,0,0,0,0,-
671,POLA,Pool Advista Finance Tbk.,https://s3.goapi.io/logo/POLA.jpg,2327,2327,2327,2327,2327,0,0,0,0,0,-
359,HILL,Hillcon Tbk.,https://s3.goapi.io/logo/HILL.jpg,3087,3087,3087,3087,3087,0,0,0,0,0,-
37,AMMN,Amman Mineral Internasional Tbk.,https://s3.goapi.io/logo/AMMN.jpg,3496,3496,3496,3496,3496,0,0,0,0,0,-
460,KING,Hoffmen Cleanindo Tbk.,https://s3.goapi.io/logo/KING.jpg,4435,4435,4435,4435,4435,0,0,0,0,0,-
130,BIRD,Blue Bird Tbk.,https://s3.goapi.io/logo/BIRD.jpg,2830,2830,2830,2830,2830,0,0,0,0,0,-
154,BOLT,Garuda Metalindo Tbk.,https://s3.goapi.io/logo/BOLT.jpg,1359,1359,1359,1359,1359,0,0,0,0,0,-
553,MGRO,Mahkota Group Tbk.,https://s3.goapi.io/logo/MGRO.jpg,2791,2791,2791,2791,2791,0,0,0,0,0,-
271,EAST,Eastparc Hotel Tbk.,https://s3.goapi.io/logo/EAST.jpg,4190,4190,4190,4190,4190,0,0,0,0,0,-
121,BHAT,Bhakti Multi Artha Tbk.,https://s3.goapi.io/logo/BHAT.jpg,3407,3407,3407,3407,3407,0,0,0,0,0,-
562,MKNT,Mitra Komunikasi Nusantara Tbk.,https://s3.goapi.io/logo/MKNT.jpg,4929,4929,4929,4929,4929,0,0,0,0,0,-
743,SBAT,Sejahtera Bintang Abadi Textile Tbk.,https://s3.goapi.io/logo/SBAT.jpg,2684,2684,2684,2684,2684,0,0,0,0,0,-
124,BIKE,Sepeda Bersama Indonesia Tbk.,https://s3.goapi.io/logo/BIKE.jpg,1234,1234,1234,1234,1234,0,0,0,0,0,-
139,BLUE,Berkah Prima Perkasa Tbk.,https://s3.goapi.io/logo/BLUE.jpg,2325,2325,2325,2325,2325,0,0,0,0,0,-
303,FISH,FKS Multi Agro Tbk.,https://s3.goapi.io/logo/FISH.jpg,3087,3087,3087,3087,3087,0,0,0,0,0,-
789,SOHO,Soho Global Health Tbk.,https://s3.goapi.io/logo/SOHO.jpg,1996,1996,1996,1996,1996,0,0,0,0,0,-
757,SHIP,Sillo Maritime Perdana Tbk.,https://s3.goapi.io/logo/SHIP.jpg,4977,4977,4977,4977,4977,0,0,0,0,0,-
235,DADA,Diamond Citra Propertindo Tbk.,https://s3.goapi.io/logo/DADA.jpg,2018,2018,2018,2018,2018,0,0,0,0,0,-
31,ALTO,Tri Banyan Tirta Tbk.,https://s3.goapi.io/logo/ALTO.jpg,4664,4664,4664,4664,4664,0,0,0,0,0,-
928,ZONE,Mega Perintis Tbk.,https://s3.goapi.io/logo/ZONE.jpg,4851,4851,4851,4851,4851,0,0,0,0,0,-
614,NINE,Techno9 Indonesia Tbk.,https://s3.goapi.io/logo/NINE.jpg,2616,2616,2616,2616,2616,0,0,0,0,0,-
397,INDO,Royalindo Investa Wijaya Tbk.,https://s3.goapi.io/logo/INDO.jpg,1613,1613,1613,1613,1613,0,0,0,0,0,-
262,DRMA,Dharma Polimetal Tbk.,https://s3.goapi.io/logo/DRMA.jpg,2503,2503,2503,2503,2503,0,0,0,0,0,-
760,SILO,Siloam International Hospitals Tbk.,https://s3.goapi.io/logo/SILO.jpg,1109,1109,1109,1109,1109,0,0,0,0,0,-
821,TARA,Agung Semesta Sejahtera Tbk.,https://s3.goapi.io/logo/TARA.jpg,4574,4574,4574,4574,4574,0,0,0,0,0,-
217,CNTX,Century Textile Industry Tbk.,https://s3.goapi.io/logo/CNTX.jpg,3078,3078,3078,3078,3078,0,0,0,0,0,-
69,ASPI,Andalan Sakti Primaindo Tbk.,https://s3.goapi.io/logo/ASPI.jpg,1945,1945,1945,1945,1945,0,0,0,0,0,-
118,BEST,Bekasi Fajar Industrial Estate Tbk.,https://s3.goapi.io/logo/BEST.jpg,4731,4731,4731,4731,4731,0,0,0,0,0,-
7,ACST,Acset Indonusa Tbk.,https://s3.goapi.io/logo/ACST.jpg,3615,3615,3615,3615,3615,0,0,0,0,0,-
302,FIRE,Alfa Energi Investama Tbk.,https://s3.goapi.io/logo/FIRE.jpg,3882,3882,3882,3882,3882,0,0,0,0,0,-
559,MIRA,Mitra International Resources Tbk.,https://s3.goapi.io/logo/MIRA.jpg,2384,2384,2384,2384,2384,0,0,0,0,0,-
822,TAXI,Express Transindo Utama Tbk.,https://s3.goapi.io/logo/TAXI.jpg,1382,1382,1382,1382,1382,0,0,0,0,0,-
718,REAL,Repower Asia Indonesia Tbk.,https://s3.goapi.io/logo/REAL.jpg,2616,2616,2616,2616,2616,0,0,0,0,0,-
825,TBLA,Tunas Baru Lampung Tbk.,https://s3.goapi.io/logo/TBLA.jpg,3910,3910,3910,3910,3910,0,0,0,0,0,-
570,MMLP,Mega Manunggal Property Tbk.,https://s3.goapi.io/logo/MMLP.jpg,1967,1967,1967,1967,1967,0,0,0,0,0,-
378,ICON,Island Concepts Indonesia Tbk.,https://s3.goapi.io/logo/ICON.jpg,4006,4006,4006,4006,4006,0,0,0,0,0,-
277,ELSA,Elnusa Tbk.,https://s3.goapi.io/logo/ELSA.jpg,1966,1966,1966,1966,1966,0,0,0,0,0,-
884,UNIT,Nusantara Inti Corpora Tbk,https://s3.goapi.io/logo/UNIT.jpg,3376,3376,3376,3376,3376,0,0,0,0,0,-
720,RELI,Reliance Sekuritas Indonesia Tbk.,https://s3.goapi.io/logo/RELI.jpg,3663,3663,3663,3663,3663,0,0,0,0,0,-
537,MDIA,Intermedia Capital Tbk.,https://s3.goapi.io/logo/MDIA.jpg,2609,2609,2609,2609,2609,0,0,0,0,0,-
524,MARI,Mahaka Radio Integra Tbk.,https://s3.goapi.io/logo/MARI.jpg,2788,2788,2788,2788,2788,0,0,0,0,0,-
346,HADE,Himalaya Energi Perkasa Tbk.,https://s3.goapi.io/logo/HADE.jpg,3530,3530,3530,3530,3530,0,0,0,0,0,-
308,FOOD,Sentra Food Indonesia Tbk.,https://s3.goapi.io/logo/FOOD.jpg,4126,4126,4126,4126,4126,0,0,0,0,0,-
495,LINK,Link Net Tbk.,https://s3.goapi.io/logo/LINK.jpg,2195,2195,2195,2195,2195,0,0,0,0,0,-
711,RAFI,Sari Kreasi Boga Tbk.,https://s3.goapi.io/logo/RAFI.jpg,4499,4499,4499,4499,4499,0,0,0,0,0,-
494,LIFE,MSIG Life Insurance Indonesia Tbk.,https://s3.goapi.io/logo/LIFE.jpg,3227,3227,3227,3227,3227,0,0,0,0,0,-
215,CNKO,Exploitasi Energi Indonesia Tbk.,https://s3.goapi.io/logo/CNKO.jpg,1228,1228,1228,1228,1228,0,0,0,0,0,-
374,IBFN,Intan Baru Prana Tbk.,https://s3.goapi.io/logo/IBFN.jpg,2518,2518,2518,2518,2518,0,0,0,0,0,-
541,MDRN,Modern Internasional Tbk.,https://s3.goapi.io/logo/MDRN.jpg,2643,2643,2643,2643,2643,0,0,0,0,0,-
514,LUCY,Lima Dua Lima Tiga Tbk.,https://s3.goapi.io/logo/LUCY.jpg,3724,3724,3724,3724,3724,0,0,0,0,0,-
111,BEBS,Berkah Beton Sadaya Tbk.,https://s3.goapi.io/logo/BEBS.jpg,1569,1569,1569,1569,1569,0,0,0,0,0,-
489,LAPD,Leyand International Tbk.,https://s3.goapi.io/logo/LAPD.jpg,1303,1303,1303,1303,1303,0,0,0,0,0,-
636,PADI,Minna Padi Investama Sekuritas Tbk.,https://s3.goapi.io/logo/PADI.jpg,1532,1532,1532,1532,1532,0,0,0,0,0,-
819,TAMU,Pelayaran Tamarin Samudra Tbk.,https://s3.goapi.io/logo/TAMU.jpg,3588,3588,3588,3588,3588,0,0,0,0,0,-
896,VIVA,Visi Media Asia Tbk.,https://s3.goapi.io/logo/VIVA.jpg,1947,1947,1947,1947,1947,0,0,0,0,0,-
205,CINT,Chitose Internasional Tbk.,https://s3.goapi.io/logo/CINT.jpg,2549,2549,2549,2549,2549,0,0,0,0,0,-
611,NICK,Charnic Capital Tbk.,https://s3.goapi.io/logo/NICK.jpg,1876,1876,1876,1876,1876,0,0,0,0,0,-
54,ARKO,Arkora Hydro Tbk.,https://s3.goapi.io/logo/ARKO.jpg,1166,1166,1166,1166,1166,0,0,0,0,0,-
483,KREN,Quantum Clovera Investama Tbk.,https://s3.goapi.io/logo/KREN.jpg,2524,2524,2524,2524,2524,0,0,0,0,0,-
630,OLIV,Oscar Mitra Sukses Sejahtera Tbk.,https://s3.goapi.io/logo/OLIV.jpg,3737,3737,3737,3737,3737,0,0,0,0,0,-
657,PIPA,Multi Makmur Lemindo Tbk.,https://s3.goapi.io/logo/PIPA.jpg,2442,2442,2442,2442,2442,0,0,0,0,0,-
634,PACK,Solusi Kemasan Digital Tbk.,https://s3.goapi.io/logo/PACK.jpg,3809,3809,3809,3809,3809,0,0,0,0,0,-
165,BSBK,Wulandari Bangun Laksana Tbk.,https://s3.goapi.io/logo/BSBK.jpg,4269,4269,4269,4269,4269,0,0,0,0,0,-
207,CITY,Natura City Developments Tbk.,https://s3.goapi.io/logo/CITY.jpg,4038,4038,4038,4038,4038,0,0,0,0,0,-
496,LION,Lion Metal Works Tbk.,https://s3.goapi.io/logo/LION.jpg,2706,2706,2706,2706,2706,0,0,0,0,0,-
355,HEAL,Medikaloka Hermina Tbk.,https://s3.goapi.io/logo/HEAL.jpg,2860,2860,2860,2860,2860,0,0,0,0,0,-
204,CHIP,Pelita Teknologi Global Tbk.,https://s3.goapi.io/logo/CHIP.jpg,1296,1296,1296,1296,1296,0,0,0,0,0,-
68,ASMI,Asuransi Maximus Graha Persada Tbk.,https://s3.goapi.io/logo/ASMI.jpg,4009,4009,4009,4009,4009,0,0,0,0,0,-
421,ISAP,Isra Presisi Indonesia Tbk.,https://s3.goapi.io/logo/ISAP.jpg,2514,2514,2514,2514,2514,0,0,0,0,0,-
433,JGLE,Graha Andrasentra Propertindo Tbk.,https://s3.goapi.io/logo/JGLE.jpg,3448,3448,3448,3448,3448,0,0,0,0,0,-
857,TOYS,Sunindo Adipersada Tbk.,https://s3.goapi.io/logo/TOYS.jpg,3835,3835,3835,3835,3835,0,0,0,0,0,-
925,ZATA,Bersama Zatta Jaya Tbk.,https://s3.goapi.io/logo/ZATA.jpg,3826,3826,3826,3826,3826,0,0,0,0,0,-
927,ZINC,Kapuas Prima Coal Tbk.,https://s3.goapi.io/logo/ZINC.jpg,4993,4993,4993,4993,4993,0,0,0,0,0,-
549,MFIN,Mandala Multifinance Tbk.,https://s3.goapi.io/logo/MFIN.jpg,2149,2149,2149,2149,2149,0,0,0,0,0,-
278,ELTY,Bakrieland Development Tbk.,https://s3.goapi.io/logo/ELTY.jpg,3818,3818,3818,3818,3818,0,0,0,0,0,-
552,MGNA,Magna Investama Mandiri Tbk.,https://s3.goapi.io/logo/MGNA.jpg,3749,3749,3749,3749,3749,0,0,0,0,0,-
906,WIDI,Widiant Jaya Krenindo Tbk.,https://s3.goapi.io/logo/WIDI.jpg,4235,4235,4235,4235,4235,0,0,0,0,0,-
141,BMBL,Lavender Bina Cendikia Tbk.,https://s3.goapi.io/logo/BMBL.jpg,3867,3867,3867,3867,3867,0,0,0,0,0,-
18,AGRO,Bank Raya Indonesia Tbk.,https://s3.goapi.io/logo/AGRO.jpg,2454,2454,2454,2454,2454,0,0,0,0,0,-
13,ADMR,Adaro Minerals Indonesia Tbk.,https://s3.goapi.io/logo/ADMR.jpg,3296,3296,3296,3296,3296,0,0,0,0,0,-
63,ASHA,Cilacap Samudera Fishing Industry Tbk.,https://s3.goapi.io/logo/ASHA.jpg,3741,3741,3741,3741,3741,0,0,0,0,0,-
420,IRSX,Aviana Sinar Abadi Tbk.,https://s3.goapi.io/logo/IRSX.jpg,1588,1588,1588,1588,1588,0,0,0,0,0,-
915,WMUU,Widodo Makmur Unggas Tbk.,https://s3.goapi.io/logo/WMUU.jpg,1659,1659,1659,1659,1659,0,0,0,0,0,-
58,ARTI,Ratu Prabu Energi Tbk,https://s3.goapi.io/logo/ARTI.jpg,4529,4529,4529,4529,4529,0,0,0,0,0,-
799,SRIL,Sri Rejeki Isman Tbk.,https://s3.goapi.io/logo/SRIL.jpg,1170,1170,1170,1170,1170,0,0,0,0,0,-
738,SAGE,Saptausaha Gemilangindah Tbk.,https://s3.goapi.io/logo/SAGE.jpg,1173,1173,1173,1173,1173,0,0,0,0,0,-
604,NATO,Surya Permata Andalan Tbk.,https://s3.goapi.io/logo/NATO.jpg,2854,2854,2854,2854,2854,0,0,0,0,0,-
677,PORT,Nusantara Pelabuhan Handal Tbk.,https://s3.goapi.io/logo/PORT.jpg,1866,1866,1866,1866,1866,0,0,0,0,0,-
852,TOPS,Totalindo Eka Persada Tbk.,https://s3.goapi.io/logo/TOPS.jpg,1629,1629,1629,1629,1629,0,0,0,0,0,-
353,HDIT,Hensel Davest Indonesia Tbk.,https://s3.goapi.io/logo/HDIT.jpg,1908,1908,1908,1908,1908,0,0,0,0,0,-
385,IKAI,Intikeramik Alamasri Industri Tbk.,https://s3.goapi.io/logo/IKAI.jpg,1366,1366,1366,1366,1366,0,0,0,0,0,-
694,PTDU,Djasa Ubersakti Tbk.,https://s3.goapi.io/logo/PTDU.jpg,2025,2025,2025,2025,2025,0,0,0,0,0,-
866,TRIS,Trisula International Tbk.,https://s3.goapi.io/logo/TRIS.jpg,1556,1556,1556,1556,1556,0,0,0,0,0,-
317,GDST,Gunawan Dianjaya Steel Tbk.,https://s3.goapi.io/logo/GDST.jpg,2294,2294,2294,2294,2294,0,0,0,0,0,-
782,SMMT,Golden Eagle Energy Tbk.,https://s3.goapi.io/logo/SMMT.jpg,4593,4593,4593,4593,4593,0,0,0,0,0,-
119,BFIN,BFI Finance  Indonesia Tbk.,https://s3.goapi.io/logo/BFIN.jpg,2951,2951,2951,2951,2951,0,0,0,0,0,-
868,TRON,Teknologi Karya Digital Nusa Tbk.,https://s3.goapi.io/logo/TRON.jpg,2199,2199,2199,2199,2199,0,0,0,0,0,-
417,IPPE,Indo Pureco Pratama Tbk.,https://s3.goapi.io/logo/IPPE.jpg,1379,1379,1379,1379,1379,0,0,0,0,0,-
546,MENN,Menn Teknologi Indonesia Tbk.,https://s3.goapi.io/logo/MENN.jpg,1039,1039,1039,1039,1039,0,0,0,0,0,-
602,NASA,Andalan Perkasa Abadi Tbk.,https://s3.goapi.io/logo/NASA.jpg,2030,2030,2030,2030,2030,0,0,0,0,0,-
683,PPRO,PP Properti Tbk.,https://s3.goapi.io/logo/PPRO.jpg,1746,1746,1746,1746,1746,0,0,0,0,0,-
914,WMPP,Widodo Makmur Perkasa Tbk.,https://s3.goapi.io/logo/WMPP.jpg,4927,4927,4927,4927,4927,0,0,0,0,0,-
613,NIKL,Pelat Timah Nusantara Tbk.,https://s3.goapi.io/logo/NIKL.jpg,1521,1521,1521,1521,1521,0,0,0,0,0,-
23,AKKU,Anugerah Kagum Karya Utama Tbk.,https://s3.goapi.io/logo/AKKU.jpg,1399,1399,1399,1399,1399,0,0,0,0,0,-
116,BELL,Trisula Textile Industries Tbk.,https://s3.goapi.io/logo/BELL.jpg,2355,2355,2355,2355,2355,0,0,0,0,0,-
477,KOTA,DMS Propertindo Tbk.,https://s3.goapi.io/logo/KOTA.jpg,2795,2795,2795,2795,2795,0,0,0,0,0,-
794,SOUL,Mitra Tirta Buwana Tbk.,https://s3.goapi.io/logo/SOUL.jpg,3029,3029,3029,3029,3029,0,0,0,0,0,-
815,SWAT,Sriwahana Adityakarta Tbk.,https://s3.goapi.io/logo/SWAT.jpg,3827,3827,3827,3827,3827,0,0,0,0,0,-
543,MEDS,Hetzer Medical Indonesia Tbk.,https://s3.goapi.io/logo/MEDS.jpg,4668,4668,4668,4668,4668,0,0,0,0,0,-
366,HOPE,Harapan Duta Pertiwi Tbk.,https://s3.goapi.io/logo/HOPE.jpg,3139,3139,3139,3139,3139,0,0,0,0,0,-
719,RELF,Graha Mitra Asia Tbk.,https://s3.goapi.io/logo/RELF.jpg,2182,2182,2182,2182,2182,0,0,0,0,0,-
922,YELO,Yelooo Integra Datanet Tbk.,https://s3.goapi.io/logo/YELO.jpg,2437,2437,2437,2437,2437,0,0,0,0,0,-
882,UNIC,Unggul Indah Cahaya Tbk.,https://s3.goapi.io/logo/UNIC.jpg,3802,3802,3802,3802,3802,0,0,0,0,0,-
864,TRIN,Perintis Triniti Properti Tbk.,https://s3.goapi.io/logo/TRIN.jpg,2382,2382,2382,2382,2382,0,0,0,0,0,-
488,LAND,Trimitra Propertindo Tbk.,https://s3.goapi.io/logo/LAND.jpg,4643,4643,4643,4643,4643,0,0,0,0,0,-
332,GOOD,Garudafood Putra Putri Jaya Tbk.,https://s3.goapi.io/logo/GOOD.jpg,1446,1446,1446,1446,1446,0,0,0,0,0,-
457,KIAS,Keramika Indonesia Assosiasi Tbk.,https://s3.goapi.io/logo/KIAS.jpg,3412,3412,3412,3412,3412,0,0,0,0,0,-
592,MTPS,Meta Epsi Tbk.,https://s3.goapi.io/logo/MTPS.jpg,1391,1391,1391,1391,1391,0,0,0,0,0,-
635,PADA,Personel Alih Daya Tbk.,https://s3.goapi.io/logo/PADA.jpg,3552,3552,3552,3552,3552,0,0,0,0,0,-
601,NANO,Nanotech Indonesia Global Tbk.,https://s3.goapi.io/logo/NANO.jpg,3121,3121,3121,3121,3121,0,0,0,0,0,-
92,BAUT,Mitra Angkasa Sejahtera Tbk.,https://s3.goapi.io/logo/BAUT.jpg,4076,4076,4076,4076,4076,0,0,0,0,0,-
818,TAMA,Lancartama Sejati Tbk.,https://s3.goapi.io/logo/TAMA.jpg,3874,3874,3874,3874,3874,0,0,0,0,0,-
499,LMAX,Lupromax Pelumas Indonesia Tbk.,https://s3.goapi.io/logo/LMAX.jpg,1756,1756,1756,1756,1756,0,0,0,0,0,-
189,CARE,Metro Healthcare Indonesia Tbk.,https://s3.goapi.io/logo/CARE.jpg,2325,2325,2325,2325,2325,0,0,0,0,0,-
582,MSIE,Multisarana Intan Eduka Tbk.,https://s3.goapi.io/logo/MSIE.jpg,3107,3107,3107,3107,3107,0,0,0,0,0,-
919,WSBP,Waskita Beton Precast Tbk.,https://s3.goapi.io/logo/WSBP.jpg,4740,4740,4740,4740,4740,0,0,0,0,0,-
640,PANR,Panorama Sentrawisata Tbk.,https://s3.goapi.io/logo/PANR.jpg,1495,1495,1495,1495,1495,0,0,0,0,0,-
365,HOMI,Grand House Mulia Tbk.,https://s3.goapi.io/logo/HOMI.jpg,4322,4322,4322,4322,4322,0,0,0,0,0,-
128,BIPI,Astrindo Nusantara Infrastruktur Tbk.,https://s3.goapi.io/logo/BIPI.jpg,4800,4800,4800,4800,4800,0,0,0,0,0,-
330,GOLD,Visi Telekomunikasi Infrastruktur Tbk.,https://s3.goapi.io/logo/GOLD.jpg,2031,2031,2031,2031,2031,0,0,0,0,0,-
446,KAYU,Darmi Bersaudara Tbk.,https://s3.goapi.io/logo/KAYU.jpg,1218,1218,1218,1218,1218,0,0,0,0,0,-
175,BTPS,Bank BTPN Syariah Tbk.,https://s3.goapi.io/logo/BTPS.jpg,3871,3871,3871,3871,3871,0,0,0,0,0,-
497,LIVE,Homeco Victoria Makmur Tbk.,https://s3.goapi.io/logo/LIVE.jpg,3218,3218,3218,3218,3218,0,0,0,0,0,-
137,BLTA,Berlian Laju Tanker Tbk,https://s3.goapi.io/logo/BLTA.jpg,1979,1979,1979,1979,1979,0,0,0,0,0,-
386,IKAN,Era Mandiri Cemerlang Tbk.,https://s3.goapi.io/logo/IKAN.jpg,2336,2336,2336,2336,2336,0,0,0,0,0,-
643,PBRX,Pan Brothers Tbk.,https://s3.goapi.io/logo/PBRX.jpg,2253,2253,2253,2253,2253,0,0,0,0,0,-
788,SOFA,Boston Furniture Industries Tbk.,https://s3.goapi.io/logo/SOFA.jpg,3803,3803,3803,3803,3803,0,0,0,0,0,-
190,CARS,Industri dan Perdagangan Bintraco Dharma Tbk.,https://s3.goapi.io/logo/CARS.jpg,4859,4859,4859,4859,4859,0,0,0,0,0,-
492,LEAD,Logindo Samudramakmur Tbk.,https://s3.goapi.io/logo/LEAD.jpg,2939,2939,2939,2939,2939,0,0,0,0,0,-
38,AMMS,Agung Menjangan Mas Tbk.,https://s3.goapi.io/logo/AMMS.jpg,1453,1453,1453,1453,1453,0,0,0,0,0,-
447,KBAG,Karya Bersama Anugerah Tbk.,https://s3.goapi.io/logo/KBAG.jpg,3401,3401,3401,3401,3401,0,0,0,0,0,-
468,KLIN,Klinko Karya Imaji Tbk.,https://s3.goapi.io/logo/KLIN.jpg,3513,3513,3513,3513,3513,0,0,0,0,0,-
605,NAYZ,Hassana Boga Sejahtera Tbk.,https://s3.goapi.io/logo/NAYZ.jpg,4938,4938,4938,4938,4938,0,0,0,0,0,-
291,ESSA,ESSA Industries Indonesia Tbk.,https://s3.goapi.io/logo/ESSA.jpg,1562,1562,1562,1562,1562,0,0,0,0,0,-
586,MSTI,Mastersystem Infotama Tbk.,https://s3.goapi.io/logo/MSTI.jpg,2756,2756,2756,2756,2756,0,0,0,0,0,-
600,MYTX,Asia Pacific Investama Tbk.,https://s3.goapi.io/logo/MYTX.jpg,4804,4804,4804,4804,4804,0,0,0,0,0,-
416,IPOL,Indopoly Swakarsa Industry Tbk.,https://s3.goapi.io/logo/IPOL.jpg,1547,1547,1547,1547,1547,0,0,0,0,0,-
357,HERO,Hero Supermarket Tbk.,https://s3.goapi.io/logo/HERO.jpg,2348,2348,2348,2348,2348,0,0,0,0,0,-
691,PSKT,Red Planet Indonesia Tbk.,https://s3.goapi.io/logo/PSKT.jpg,1070,1070,1070,1070,1070,0,0,0,0,0,-
198,CCSI,Communication Cable Systems Indonesia Tbk.,https://s3.goapi.io/logo/CCSI.jpg,4684,4684,4684,4684,4684,0,0,0,0,0,-
723,RIGS,Rig Tenders Indonesia Tbk.,https://s3.goapi.io/logo/RIGS.jpg,3672,3672,3672,3672,3672,0,0,0,0,0,-
737,SAFE,Steady Safe Tbk,https://s3.goapi.io/logo/SAFE.jpg,4993,4993,4993,4993,4993,0,0,0,0,0,-
899,VRNA,Mizuho Leasing Indonesia Tbk.,https://s3.goapi.io/logo/VRNA.jpg,2944,2944,2944,2944,2944,0,0,0,0,0,-
114,BEKS,Bank Pembangunan Daerah Banten Tbk.,https://s3.goapi.io/logo/BEKS.jpg,2184,2184,2184,2184,2184,0,0,0,0,0,-
393,INCF,Indo Komoditi Korpora Tbk.,https://s3.goapi.io/logo/INCF.jpg,2526,2526,2526,2526,2526,0,0,0,0,0,-
623,NUSA,Sinergi Megah Internusa Tbk.,https://s3.goapi.io/logo/NUSA.jpg,1130,1130,1130,1130,1130,0,0,0,0,0,-
392,INAI,Indal Aluminium Industry Tbk.,https://s3.goapi.io/logo/INAI.jpg,1798,1798,1798,1798,1798,0,0,0,0,0,-
218,COAL,Black Diamond Resources Tbk.,https://s3.goapi.io/logo/COAL.jpg,2369,2369,2369,2369,2369,0,0,0,0,0,-
290,ESIP,Sinergi Inti Plastindo Tbk.,https://s3.goapi.io/logo/ESIP.jpg,3674,3674,3674,3674,3674,0,0,0,0,0,-
619,NPGF,Nusa Palapa Gemilang Tbk.,https://s3.goapi.io/logo/NPGF.jpg,3646,3646,3646,3646,3646,0,0,0,0,0,-
814,SURI,Maja Agung Latexindo Tbk.,https://s3.goapi.io/logo/SURI.jpg,2842,2842,2842,2842,2842,0,0,0,0,0,-
918,WOWS,Ginting Jaya Energi Tbk.,https://s3.goapi.io/logo/WOWS.jpg,1116,1116,1116,1116,1116,0,0,0,0,0,-
219,COCO,Wahana Interfood Nusantara Tbk.,https://s3.goapi.io/logo/COCO.jpg,4690,4690,4690,4690,4690,0,0,0,0,0,-
730,RODA,Pikko Land Development Tbk.,https://s3.goapi.io/logo/RODA.jpg,1049,1049,1049,1049,1049,0,0,0,0,0,-
841,TIRT,Tirta Mahakam Resources Tbk,https://s3.goapi.io/logo/TIRT.jpg,4715,4715,4715,4715,4715,0,0,0,0,0,-
279,EMDE,Megapolitan Developments Tbk.,https://s3.goapi.io/logo/EMDE.jpg,1569,1569,1569,1569,1569,0,0,0,0,0,-
171,BTEK,Bumi Teknokultura Unggul Tbk,https://s3.goapi.io/logo/BTEK.jpg,4777,4777,4777,4777,4777,0,0,0,0,0,-
231,CTRA,Ciputra Development Tbk.,https://s3.goapi.io/logo/CTRA.jpg,4844,4844,4844,4844,4844,0,0,0,0,0,-
147,BNBR,Bakrie & Brothers Tbk,https://s3.goapi.io/logo/BNBR.jpg,4108,4108,4108,4108,4108,0,0,0,0,0,-
715,RBMS,Ristia Bintang Mahkotasejati Tbk.,https://s3.goapi.io/logo/RBMS.jpg,3222,3222,3222,3222,3222,0,0,0,0,0,-
749,SDMU,Sidomulyo Selaras Tbk.,https://s3.goapi.io/logo/SDMU.jpg,1914,1914,1914,1914,1914,0,0,0,0,0,-
295,EURO,Estee Gold Feet Tbk.,https://s3.goapi.io/logo/EURO.jpg,2889,2889,2889,2889,2889,0,0,0,0,0,-
528,MAXI,Maxindo Karya Anugerah Tbk.,https://s3.goapi.io/logo/MAXI.jpg,2012,2012,2012,2012,2012,0,0,0,0,0,-
15,AEGS,Anugerah Spareparts Sejahtera Tbk.,https://s3.goapi.io/logo/AEGS.jpg,1782,1782,1782,1782,1782,0,0,0,0,0,-
129,BIPP,Bhuwanatala Indah Permai Tbk.,https://s3.goapi.io/logo/BIPP.jpg,3509,3509,3509,3509,3509,0,0,0,0,0,-
685,PRAY,Famon Awal Bros Sedaya Tbk.,https://s3.goapi.io/logo/PRAY.jpg,3622,3622,3622,3622,3622,0,0,0,0,0,-
856,TOWR,Sarana Menara Nusantara Tbk.,https://s3.goapi.io/logo/TOWR.jpg,1651,1651,1651,1651,1651,0,0,0,0,0,-
404,INOV,Inocycle Technology Group Tbk.,https://s3.goapi.io/logo/INOV.jpg,1354,1354,1354,1354,1354,0,0,0,0,0,-
578,MPRO,Maha Properti Indonesia Tbk.,https://s3.goapi.io/logo/MPRO.jpg,2005,2005,2005,2005,2005,0,0,0,0,0,-
351,HBAT,Minahasa Membangun Hebat Tbk.,https://s3.goapi.io/logo/HBAT.jpg,3841,3841,3841,3841,3841,0,0,0,0,0,-
368,HRME,Menteng Heritage Realty Tbk.,https://s3.goapi.io/logo/HRME.jpg,4741,4741,4741,4741,4741,0,0,0,0,0,-
87,BALI,Bali Towerindo Sentra Tbk.,https://s3.goapi.io/logo/BALI.jpg,1910,1910,1910,1910,1910,0,0,0,0,0,-
5,ACES,Ace Hardware Indonesia Tbk.,https://s3.goapi.io/logo/ACES.jpg,3554,3554,3554,3554,3554,0,0,0,0,0,-
892,VICI,Victoria Care Indonesia Tbk.,https://s3.goapi.io/logo/VICI.jpg,4853,4853,4853,4853,4853,0,0,0,0,0,-
293,ESTI,Ever Shine Tex Tbk.,https://s3.goapi.io/logo/ESTI.jpg,2419,2419,2419,2419,2419,0,0,0,0,0,-
418,IPTV,MNC Vision Networks Tbk.,https://s3.goapi.io/logo/IPTV.jpg,4638,4638,4638,4638,4638,0,0,0,0,0,-
836,TGRA,Terregra Asia Energy Tbk.,https://s3.goapi.io/logo/TGRA.jpg,1590,1590,1590,1590,1590,0,0,0,0,0,-
222,CPRI,Capri Nusa Satu Properti Tbk.,https://s3.goapi.io/logo/CPRI.jpg,1889,1889,1889,1889,1889,0,0,0,0,0,-
284,ENZO,Morenzo Abadi Perkasa Tbk.,https://s3.goapi.io/logo/ENZO.jpg,3983,3983,3983,3983,3983,0,0,0,0,0,-
869,TRST,Trias Sentosa Tbk.,https://s3.goapi.io/logo/TRST.jpg,3486,3486,3486,3486,3486,0,0,0,0,0,-
408,INRU,Toba Pulp Lestari Tbk.,https://s3.goapi.io/logo/INRU.jpg,2048,2048,2048,2048,2048,0,0,0,0,0,-
273,EDGE,Indointernet Tbk.,https://s3.goapi.io/logo/EDGE.jpg,4030,4030,4030,4030,4030,0,0,0,0,0,-
102,BBSI,Krom Bank Indonesia Tbk.,https://s3.goapi.io/logo/BBSI.jpg,2521,2521,2521,2521,2521,0,0,0,0,0,-
155,BOSS,Borneo Olah Sarana Sukses Tbk.,https://s3.goapi.io/logo/BOSS.jpg,3055,3055,3055,3055,3055,0,0,0,0,0,-
342,GTSI,GTS Internasional Tbk.,https://s3.goapi.io/logo/GTSI.jpg,4933,4933,4933,4933,4933,0,0,0,0,0,-
409,INTA,Intraco Penta Tbk.,https://s3.goapi.io/logo/INTA.jpg,2244,2244,2244,2244,2244,0,0,0,0,0,-
396,INDF,Indofood Sukses Makmur Tbk.,https://s3.goapi.io/logo/INDF.jpg,1601,1601,1601,1601,1601,0,0,0,0,0,-
364,HOME,Hotel Mandarine Regency Tbk.,https://s3.goapi.io/logo/HOME.jpg,4959,4959,4959,4959,4959,0,0,0,0,0,-
464,KKES,Kusuma Kemindo Sentosa Tbk.,https://s3.goapi.io/logo/KKES.jpg,4131,4131,4131,4131,4131,0,0,0,0,0,-
200,CENT,Centratama Telekomunikasi Indonesia Tbk.,https://s3.goapi.io/logo/CENT.jpg,3722,3722,3722,3722,3722,0,0,0,0,0,-
399,INDS,Indospring Tbk.,https://s3.goapi.io/logo/INDS.jpg,1359,1359,1359,1359,1359,0,0,0,0,0,-
805,STAA,Sumber Tani Agung Resources Tbk.,https://s3.goapi.io/logo/STAA.jpg,4886,4886,4886,4886,4886,0,0,0,0,0,-
854,TOTL,Total Bangun Persada Tbk.,https://s3.goapi.io/logo/TOTL.jpg,3551,3551,3551,3551,3551,0,0,0,0,0,-
146,BNBA,Bank Bumi Arta Tbk.,https://s3.goapi.io/logo/BNBA.jpg,3319,3319,3319,3319,3319,0,0,0,0,0,-
285,EPAC,Megalestari Epack Sentosaraya Tbk.,https://s3.goapi.io/logo/EPAC.jpg,1653,1653,1653,1653,1653,0,0,0,0,0,-
709,PZZA,Sarimelati Kencana Tbk.,https://s3.goapi.io/logo/PZZA.jpg,4824,4824,4824,4824,4824,0,0,0,0,0,-
373,IATA,MNC Energy Investments Tbk.,https://s3.goapi.io/logo/IATA.jpg,3110,3110,3110,3110,3110,0,0,0,0,0,-
193,CASS,Cardig Aero Services Tbk.,https://s3.goapi.io/logo/CASS.jpg,3710,3710,3710,3710,3710,0,0,0,0,0,-
301,FIMP,Fimperkasa Utama Tbk.,https://s3.goapi.io/logo/FIMP.jpg,4382,4382,4382,4382,4382,0,0,0,0,0,-
188,CANI,Capitol Nusantara Indonesia Tbk.,https://s3.goapi.io/logo/CANI.jpg,1218,1218,1218,1218,1218,0,0,0,0,0,-
428,JAST,Jasnita Telekomindo Tbk.,https://s3.goapi.io/logo/JAST.jpg,2540,2540,2540,2540,2540,0,0,0,0,0,-
122,BHIT,MNC Asia Holding Tbk.,https://s3.goapi.io/logo/BHIT.jpg,4785,4785,4785,4785,4785,0,0,0,0,0,-
135,BKSL,Sentul City Tbk.,https://s3.goapi.io/logo/BKSL.jpg,2646,2646,2646,2646,2646,0,0,0,0,0,-
889,URBN,Urban Jakarta Propertindo Tbk.,https://s3.goapi.io/logo/URBN.jpg,4359,4359,4359,4359,4359,0,0,0,0,0,-
502,LOPI,Logisticsplus International Tbk.,https://s3.goapi.io/logo/LOPI.jpg,4660,4660,4660,4660,4660,0,0,0,0,0,-
770,SMAR,Smart Tbk.,https://s3.goapi.io/logo/SMAR.jpg,3826,3826,3826,3826,3826,0,0,0,0,0,-
292,ESTA,Esta Multi Usaha Tbk.,https://s3.goapi.io/logo/ESTA.jpg,3114,3114,3114,3114,3114,0,0,0,0,0,-
8,ADCP,Adhi Commuter Properti Tbk.,https://s3.goapi.io/logo/ADCP.jpg,4845,4845,4845,4845,4845,0,0,0,0,0,-
55,ARMY,Armidian Karyatama Tbk.,https://s3.goapi.io/logo/ARMY.jpg,4482,4482,4482,4482,4482,0,0,0,0,0,-
73,ATAP,Trimitra Prawara Goldland Tbk.,https://s3.goapi.io/logo/ATAP.jpg,1195,1195,1195,1195,1195,0,0,0,0,0,-
75,ATLA,Atlantis Subsea Indonesia Tbk.,https://s3.goapi.io/logo/ATLA.jpg,3760,3760,3760,3760,3760,0,0,0,0,0,-
81,AYLS,Agro Yasa Lestari Tbk.,https://s3.goapi.io/logo/AYLS.jpg,1726,1726,1726,1726,1726,0,0,0,0,0,-
90,BAPI,Bhakti Agung Propertindo Tbk.,https://s3.goapi.io/logo/BAPI.jpg,2416,2416,2416,2416,2416,0,0,0,0,0,-
108,BCIP,Bumi Citra Permai Tbk.,https://s3.goapi.io/logo/BCIP.jpg,3511,3511,3511,3511,3511,0,0,0,0,0,-
134,BKDP,Bukit Darmo Property Tbk,https://s3.goapi.io/logo/BKDP.jpg,2109,2109,2109,2109,2109,0,0,0,0,0,-
172,BTEL,Bakrie Telecom Tbk.,https://s3.goapi.io/logo/BTEL.jpg,3765,3765,3765,3765,3765,0,0,0,0,0,-
194,CBMF,Cahaya Bintang Medan Tbk.,https://s3.goapi.io/logo/CBMF.jpg,2835,2835,2835,2835,2835,0,0,0,0,0,-
220,COWL,Cowell Development Tbk.,https://s3.goapi.io/logo/COWL.jpg,1732,1732,1732,1732,1732,0,0,0,0,0,-
227,CSIS,Cahayasakti Investindo Sukses Tbk.,https://s3.goapi.io/logo/CSIS.jpg,3172,3172,3172,3172,3172,0,0,0,0,0,-
245,DFAM,Dafam Property Indonesia Tbk.,https://s3.goapi.io/logo/DFAM.jpg,2208,2208,2208,2208,2208,0,0,0,0,0,-
283,ENVY,Envy Technologies Indonesia Tbk.,https://s3.goapi.io/logo/ENVY.jpg,1386,1386,1386,1386,1386,0,0,0,0,0,-
331,GOLL,Golden Plantation Tbk.,https://s3.goapi.io/logo/GOLL.jpg,3105,3105,3105,3105,3105,0,0,0,0,0,-
337,GRPH,Griptha Putra Persada Tbk.,https://s3.goapi.io/logo/GRPH.jpg,3441,3441,3441,3441,3441,0,0,0,0,0,-
339,GSMF,Equity Development Investment Tbk.,https://s3.goapi.io/logo/GSMF.jpg,2598,2598,2598,2598,2598,0,0,0,0,0,-
361,HKMU,HK Metals Utama Tbk.,https://s3.goapi.io/logo/HKMU.jpg,1702,1702,1702,1702,1702,0,0,0,0,0,-
367,HOTL,Saraswati Griya Lestari Tbk.,https://s3.goapi.io/logo/HOTL.jpg,1545,1545,1545,1545,1545,0,0,0,0,0,-
384,IIKP,Inti Agri Resources Tbk,https://s3.goapi.io/logo/IIKP.jpg,3644,3644,3644,3644,3644,0,0,0,0,0,-
429,JATI,Informasi Teknologi Indonesia Tbk.,https://s3.goapi.io/logo/JATI.jpg,2345,2345,2345,2345,2345,0,0,0,0,0,-
451,KBRI,Kertas Basuki Rachmat Indonesia Tbk.,https://s3.goapi.io/logo/KBRI.jpg,2538,2538,2538,2538,2538,0,0,0,0,0,-
462,KIOS,Kioson Komersial Indonesia Tbk.,https://s3.goapi.io/logo/KIOS.jpg,4884,4884,4884,4884,4884,0,0,0,0,0,-
478,KPAL,Steadfast Marine Tbk.,https://s3.goapi.io/logo/KPAL.jpg,4405,4405,4405,4405,4405,0,0,0,0,0,-
485,KUAS,Ace Oldfields Tbk.,https://s3.goapi.io/logo/KUAS.jpg,2138,2138,2138,2138,2138,0,0,0,0,0,-
487,LAJU,Jasa Berdikari Logistics Tbk.,https://s3.goapi.io/logo/LAJU.jpg,3849,3849,3849,3849,3849,0,0,0,0,0,-
498,LMAS,Limas Indonesia Makmur Tbk,https://s3.goapi.io/logo/LMAS.jpg,3236,3236,3236,3236,3236,0,0,0,0,0,-
515,MABA,Marga Abhinaya Abadi Tbk.,https://s3.goapi.io/logo/MABA.jpg,1487,1487,1487,1487,1487,0,0,0,0,0,-
519,MAMI,Mas Murni Indonesia Tbk,https://s3.goapi.io/logo/MAMI.jpg,2745,2745,2745,2745,2745,0,0,0,0,0,-
540,MDLN,Modernland Realty Tbk.,https://s3.goapi.io/logo/MDLN.jpg,2982,2982,2982,2982,2982,0,0,0,0,0,-
576,MPOW,Megapower Makmur Tbk.,https://s3.goapi.io/logo/MPOW.jpg,4861,4861,4861,4861,4861,0,0,0,0,0,-
577,MPPA,Matahari Putra Prima Tbk.,https://s3.goapi.io/logo/MPPA.jpg,1048,1048,1048,1048,1048,0,0,0,0,0,-
589,MTFN,Capitalinc Investment Tbk.,https://s3.goapi.io/logo/MTFN.jpg,4351,4351,4351,4351,4351,0,0,0,0,0,-
622,NTBK,Nusatama Berkah Tbk.,https://s3.goapi.io/logo/NTBK.jpg,1883,1883,1883,1883,1883,0,0,0,0,0,-
624,NZIA,Nusantara Almazia Tbk.,https://s3.goapi.io/logo/NZIA.jpg,3984,3984,3984,3984,3984,0,0,0,0,0,-
638,PAMG,Bima Sakti Pertiwi Tbk.,https://s3.goapi.io/logo/PAMG.jpg,4072,4072,4072,4072,4072,0,0,0,0,0,-
666,PNBS,Bank Panin Dubai Syariah Tbk.,https://s3.goapi.io/logo/PNBS.jpg,1312,1312,1312,1312,1312,0,0,0,0,0,-
678,POSA,Bliss Properti Indonesia Tbk.,https://s3.goapi.io/logo/POSA.jpg,3116,3116,3116,3116,3116,0,0,0,0,0,-
724,RIMO,Rimo International Lestari Tbk,https://s3.goapi.io/logo/RIMO.jpg,3369,3369,3369,3369,3369,0,0,0,0,0,-
761,SIMA,Siwani Makmur Tbk,https://s3.goapi.io/logo/SIMA.jpg,3180,3180,3180,3180,3180,0,0,0,0,0,-
797,SQMI,Wilton Makmur Indonesia Tbk.,https://s3.goapi.io/logo/SQMI.jpg,3039,3039,3039,3039,3039,0,0,0,0,0,-
807,STRK,Lovina Beach Brewery Tbk.,https://s3.goapi.io/logo/STRK.jpg,4477,4477,4477,4477,4477,0,0,0,0,0,-
809,SUGI,Sugih Energy Tbk.,https://s3.goapi.io/logo/SUGI.jpg,4838,4838,4838,4838,4838,0,0,0,0,0,-
837,TGUK,Platinum Wahab Nusantara Tbk.,https://s3.goapi.io/logo/TGUK.jpg,1995,1995,1995,1995,1995,0,0,0,0,0,-
853,TOSK,Topindo Solusi Komunika Tbk.,https://s3.goapi.io/logo/TOSK.jpg,3689,3689,3689,3689,3689,0,0,0,0,0,-
860,TRAM,Trada Alam Minera Tbk.,https://s3.goapi.io/logo/TRAM.jpg,1143,1143,1143,1143,1143,0,0,0,0,0,-
862,TRIL,Triwira Insanlestari Tbk.,https://s3.goapi.io/logo/TRIL.jpg,3438,3438,3438,3438,3438,0,0,0,0,0,-
223,CPRO,Central Proteina Prima Tbk.,https://s3.goapi.io/logo/CPRO.jpg,3497,3497,3497,3497,3497,0,0,0,0,0,-
261,DPUM,Dua Putra Utama Makmur Tbk.,https://s3.goapi.io/logo/DPUM.jpg,1485,1485,1485,1485,1485,0,0,0,0,0,-
768,SKYB,Northcliff Citranusa Indonesia Tbk.,https://s3.goapi.io/logo/SKYB.jpg,2518,2518,2518,2518,2518,0,0,0,0,0,-
779,SMKM,Sumber Mas Konstruksi Tbk.,https://s3.goapi.io/logo/SMKM.jpg,3680,3680,3680,3680,3680,0,0,0,0,0,-
518,MAIN,Malindo Feedmill Tbk.,https://s3.goapi.io/logo/MAIN.jpg,3076,3076,3076,3076,3076,0,0,0,0,0,-
259,DOOH,Era Media Sejahtera Tbk.,https://s3.goapi.io/logo/DOOH.jpg,4647,4647,4647,4647,4647,0,0,0,0,0,-
440,JSKY,Sky Energy Indonesia Tbk.,https://s3.goapi.io/logo/JSKY.jpg,4338,4338,4338,4338,4338,0,0,0,0,0,-
567,MLPL,Multipolar Tbk.,https://s3.goapi.io/logo/MLPL.jpg,2976,2976,2976,2976,2976,0,0,0,0,0,-
736,RUNS,Global Sukses Solusi Tbk.,https://s3.goapi.io/logo/RUNS.jpg,4467,4467,4467,4467,4467,0,0,0,0,0,-
82,BABP,Bank MNC Internasional Tbk.,https://s3.goapi.io/logo/BABP.jpg,3302,3302,3302,3302,3302,0,0,0,0,0,-
184,BWPT,Eagle High Plantations Tbk.,https://s3.goapi.io/logo/BWPT.jpg,1091,1091,1091,1091,1091,0,0,0,0,0,-
333,GOTO,GoTo Gojek Tokopedia Tbk.,https://s3.goapi.io/logo/GOTO.jpg,2390,2390,2390,2390,2390,0,0,0,0,0,-
472,KOCI,Kokoh Exa Nusantara Tbk.,https://s3.goapi.io/logo/KOCI.jpg,4289,4289,4289,4289,4289,0,0,0,0,0,-
509,LPPS,Lenox Pasifik Investama Tbk.,https://s3.goapi.io/logo/LPPS.jpg,3217,3217,3217,3217,3217,0,0,0,0,0,-
513,LUCK,Sentral Mitra Informatika Tbk.,https://s3.goapi.io/logo/LUCK.jpg,3456,3456,3456,3456,3456,0,0,0,0,0,-
790,SOLA,Xolare RCR Energy Tbk.,https://s3.goapi.io/logo/SOLA.jpg,3793,3793,3793,3793,3793,0,0,0,0,0,-
851,TOOL,Rohartindo Nusantara Luas Tbk.,https://s3.goapi.io/logo/TOOL.jpg,3613,3613,3613,3613,3613,0,0,0,0,0,-
879,UDNG,Agro Bahari Nusantara Tbk.,https://s3.goapi.io/logo/UDNG.jpg,3768,3768,3768,3768,3768,0,0,0,0,0,-
352,HDFA,Radana Bhaskara Finance Tbk.,https://s3.goapi.io/logo/HDFA.jpg,4170,4170,4170,4170,4170,0,0,0,0,0,-
401,INDY,Indika Energy Tbk.,https://s3.goapi.io/logo/INDY.jpg,3716,3716,3716,3716,3716,0,0,0,0,0,-
123,BIKA,Binakarya Jaya Abadi Tbk.,https://s3.goapi.io/logo/BIKA.jpg,2806,2806,2806,2806,2806,0,0,0,0,0,-
182,BUVA,Bukit Uluwatu Villa Tbk.,https://s3.goapi.io/logo/BUVA.jpg,3306,3306,3306,3306,3306,0,0,0,0,0,-
263,DSFI,Dharma Samudera Fishing Industries Tbk.,https://s3.goapi.io/logo/DSFI.jpg,1686,1686,1686,1686,1686,0,0,0,0,0,-
405,INPC,Bank Artha Graha Internasional Tbk.,https://s3.goapi.io/logo/INPC.jpg,1447,1447,1447,1447,1447,0,0,0,0,0,-
437,JMAS,Asuransi Jiwa Syariah Jasa Mitra Abadi Tbk.,https://s3.goapi.io/logo/JMAS.jpg,2834,2834,2834,2834,2834,0,0,0,0,0,-
349,HALO,Haloni Jane Tbk.,https://s3.goapi.io/logo/HALO.jpg,1923,1923,1923,1923,1923,0,0,0,0,0,-
30,ALMI,Alumindo Light Metal Industry Tbk.,https://s3.goapi.io/logo/ALMI.jpg,3917,3917,3917,3917,3917,0,0,0,0,0,-
463,KJEN,Krida Jaringan Nusantara Tbk.,https://s3.goapi.io/logo/KJEN.jpg,2361,2361,2361,2361,2361,0,0,0,0,0,-
569,MMIX,Multi Medika Internasional Tbk.,https://s3.goapi.io/logo/MMIX.jpg,4263,4263,4263,4263,4263,0,0,0,0,0,-
904,WGSH,Wira Global Solusi Tbk.,https://s3.goapi.io/logo/WGSH.jpg,4580,4580,4580,4580,4580,0,0,0,0,0,-
687,PRIM,Royal Prima Tbk.,https://s3.goapi.io/logo/PRIM.jpg,2524,2524,2524,2524,2524,0,0,0,0,0,-
307,FOLK,Multi Garam Utama Tbk.,https://s3.goapi.io/logo/FOLK.jpg,4964,4964,4964,4964,4964,0,0,0,0,0,-
484,KRYA,Bangun Karya Perkasa Jaya Tbk.,https://s3.goapi.io/logo/KRYA.jpg,4412,4412,4412,4412,4412,0,0,0,0,0,-
574,MPIX,Mitra Pedagang Indonesia Tbk.,https://s3.goapi.io/logo/MPIX.jpg,2679,2679,2679,2679,2679,0,0,0,0,0,-
96,BBKP,Bank KB Bukopin Tbk.,https://s3.goapi.io/logo/BBKP.jpg,3479,3479,3479,3479,3479,0,0,0,0,0,-
450,KBLV,First Media Tbk.,https://s3.goapi.io/logo/KBLV.jpg,3833,3833,3833,3833,3833,0,0,0,0,0,-
769,SLIS,Gaya Abadi Sempurna Tbk.,https://s3.goapi.io/logo/SLIS.jpg,3404,3404,3404,3404,3404,0,0,0,0,0,-
85,BAIK,Bersama Mencapai Puncak Tbk.,https://s3.goapi.io/logo/BAIK.jpg,1368,1368,1368,1368,1368,0,0,0,0,0,-
136,BKSW,Bank QNB Indonesia Tbk.,https://s3.goapi.io/logo/BKSW.jpg,1956,1956,1956,1956,1956,0,0,0,0,0,-
328,GMFI,Garuda Maintenance Facility Aero Asia Tbk.,https://s3.goapi.io/logo/GMFI.jpg,4418,4418,4418,4418,4418,0,0,0,0,0,-
436,JKSW,Jakarta Kyoei Steel Works Tbk.,https://s3.goapi.io/logo/JKSW.jpg,1326,1326,1326,1326,1326,0,0,0,0,0,-
780,SMLE,Sinergi Multi Lestarindo Tbk.,https://s3.goapi.io/logo/SMLE.jpg,3212,3212,3212,3212,3212,0,0,0,0,0,-
910,WINE,Hatten Bali Tbk.,https://s3.goapi.io/logo/WINE.jpg,3172,3172,3172,3172,3172,0,0,0,0,0,-
101,BBRM,Pelayaran Nasional Bina Buana Raya Tbk.,https://s3.goapi.io/logo/BBRM.jpg,1522,1522,1522,1522,1522,0,0,0,0,0,-
120,BGTG,Bank Ganesha Tbk.,https://s3.goapi.io/logo/BGTG.jpg,1244,1244,1244,1244,1244,0,0,0,0,0,-
67,ASLI,Asri Karya Lestari Tbk.,https://s3.goapi.io/logo/ASLI.jpg,4361,4361,4361,4361,4361,0,0,0,0,0,-
413,IPAC,Era Graharealty Tbk.,https://s3.goapi.io/logo/IPAC.jpg,3367,3367,3367,3367,3367,0,0,0,0,0,-
324,GIAA,Garuda Indonesia (Persero) Tbk.,https://s3.goapi.io/logo/GIAA.jpg,1413,1413,1413,1413,1413,0,0,0,0,0,-
479,KPAS,Cottonindo Ariesta Tbk.,https://s3.goapi.io/logo/KPAS.jpg,2548,2548,2548,2548,2548,0,0,0,0,0,-
53,ARKA,Arkha Jayanti Persada Tbk.,https://s3.goapi.io/logo/ARKA.jpg,2904,2904,2904,2904,2904,0,0,0,0,0,-
506,LPKR,Lippo Karawaci Tbk.,https://s3.goapi.io/logo/LPKR.jpg,4938,4938,4938,4938,4938,0,0,0,0,0,-
696,PTMP,Mitra Pack Tbk.,https://s3.goapi.io/logo/PTMP.jpg,3574,3574,3574,3574,3574,0,0,0,0,0,-
91,BATA,Sepatu Bata Tbk.,https://s3.goapi.io/logo/BATA.jpg,3887,3887,3887,3887,3887,0,0,0,0,0,-
493,LFLO,Imago Mulia Persada Tbk.,https://s3.goapi.io/logo/LFLO.jpg,4864,4864,4864,4864,4864,0,0,0,0,0,-
551,MGLV,Panca Anugrah Wisesa Tbk.,https://s3.goapi.io/logo/MGLV.jpg,2527,2527,2527,2527,2527,0,0,0,0,0,-
244,DEWI,Dewi Shri Farmindo Tbk.,https://s3.goapi.io/logo/DEWI.jpg,2464,2464,2464,2464,2464,0,0,0,0,0,-
305,FLMC,Falmaco Nonwoven Industri Tbk.,https://s3.goapi.io/logo/FLMC.jpg,2917,2917,2917,2917,2917,0,0,0,0,0,-
536,MCOR,Bank China Construction Bank Indonesia Tbk.,https://s3.goapi.io/logo/MCOR.jpg,1099,1099,1099,1099,1099,0,0,0,0,0,-
902,WEGE,Wijaya Karya Bangunan Gedung Tbk.,https://s3.goapi.io/logo/WEGE.jpg,2976,2976,2976,2976,2976,0,0,0,0,0,-
243,DEWA,Darma Henwa Tbk,https://s3.goapi.io/logo/DEWA.jpg,2035,2035,2035,2035,2035,0,0,0,0,0,-
94,BBCA,Bank Central Asia Tbk.,https://s3.goapi.io/logo/BBCA.jpg,1135,1135,1135,1135,1135,0,0,0,0,0,-
816,SWID,Saraswanti Indoland Development Tbk.,https://s3.goapi.io/logo/SWID.jpg,2374,2374,2374,2374,2374,0,0,0,0,0,-
192,CASH,Cashlez Worldwide Indonesia Tbk.,https://s3.goapi.io/logo/CASH.jpg,3081,3081,3081,3081,3081,0,0,0,0,0,-
461,KINO,Kino Indonesia Tbk.,https://s3.goapi.io/logo/KINO.jpg,4287,4287,4287,4287,4287,0,0,0,0,0,-
213,CMPP,AirAsia Indonesia Tbk.,https://s3.goapi.io/logo/CMPP.jpg,4275,4275,4275,4275,4275,0,0,0,0,0,-
203,CHEM,Chemstar Indonesia Tbk.,https://s3.goapi.io/logo/CHEM.jpg,3946,3946,3946,3946,3946,0,0,0,0,0,-
294,ETWA,Eterindo Wahanatama Tbk,https://s3.goapi.io/logo/ETWA.jpg,1430,1430,1430,1430,1430,0,0,0,0,0,-
298,FAST,Fast Food Indonesia Tbk.,https://s3.goapi.io/logo/FAST.jpg,1809,1809,1809,1809,1809,0,0,0,0,0,-
473,KOIN,Kokoh Inti Arebama Tbk,https://s3.goapi.io/logo/KOIN.jpg,4049,4049,4049,4049,4049,0,0,0,0,0,-
848,TMPO,Tempo Intimedia Tbk.,https://s3.goapi.io/logo/TMPO.jpg,1244,1244,1244,1244,1244,0,0,0,0,0,-
474,KOKA,Koka Indonesia Tbk.,https://s3.goapi.io/logo/KOKA.jpg,3910,3910,3910,3910,3910,0,0,0,0,0,-
698,PTPS,Pulau Subur Tbk.,https://s3.goapi.io/logo/PTPS.jpg,1045,1045,1045,1045,1045,0,0,0,0,0,-
395,INCO,Vale Indonesia Tbk.,https://s3.goapi.io/logo/INCO.jpg,3475,3475,3475,3475,3475,0,0,0,0,0,-
371,HUMI,Humpuss Maritim Internasional Tbk.,https://s3.goapi.io/logo/HUMI.jpg,2573,2573,2573,2573,2573,0,0,0,0,0,-
533,MBTO,Martina Berto Tbk.,https://s3.goapi.io/logo/MBTO.jpg,1024,1024,1024,1024,1024,0,0,0,0,0,-
681,PPRE,PP Presisi Tbk.,https://s3.goapi.io/logo/PPRE.jpg,3927,3927,3927,3927,3927,0,0,0,0,0,-
823,TAYS,Jaya Swarasa Agung Tbk.,https://s3.goapi.io/logo/TAYS.jpg,1570,1570,1570,1570,1570,0,0,0,0,0,-
596,MUTU,Mutuagung Lestari Tbk.,https://s3.goapi.io/logo/MUTU.jpg,3204,3204,3204,3204,3204,0,0,0,0,0,-
241,DEFI,Danasupra Erapacific Tbk.,https://s3.goapi.io/logo/DEFI.jpg,4765,4765,4765,4765,4765,0,0,0,0,0,-
181,BUMI,Bumi Resources Tbk.,https://s3.goapi.io/logo/BUMI.jpg,4535,4535,4535,4535,4535,0,0,0,0,0,-
256,DNAR,Bank Oke Indonesia Tbk.,https://s3.goapi.io/logo/DNAR.jpg,3917,3917,3917,3917,3917,0,0,0,0,0,-
6,ACRO,Samcro Hyosung Adilestari Tbk.,https://s3.goapi.io/logo/ACRO.jpg,1891,1891,1891,1891,1891,0,0,0,0,0,-
633,OPMS,Optima Prima Metal Sinergi Tbk.,https://s3.goapi.io/logo/OPMS.jpg,1540,1540,1540,1540,1540,0,0,0,0,0,-
400,INDX,Tanah Laut Tbk,https://s3.goapi.io/logo/INDX.jpg,2656,2656,2656,2656,2656,0,0,0,0,0,-
917,WOOD,Integra Indocabinet Tbk.,https://s3.goapi.io/logo/WOOD.jpg,1378,1378,1378,1378,1378,0,0,0,0,0,-
831,TECH,Indosterling Technomedia Tbk.,https://s3.goapi.io/logo/TECH.jpg,3491,3491,3491,3491,3491,0,0,0,0,0,-
729,ROCK,Rockfields Properti Indonesia Tbk.,https://s3.goapi.io/logo/ROCK.jpg,1557,1557,1557,1557,1557,0,0,0,0,0,-
125,BIMA,Primarindo Asia Infrastructure Tbk.,https://s3.goapi.io/logo/BIMA.jpg,1333,1333,1333,1333,1333,0,0,0,0,0,-
689,PSDN,Prasidha Aneka Niaga Tbk,https://s3.goapi.io/logo/PSDN.jpg,4247,4247,4247,4247,4247,0,0,0,0,0,-
885,UNSP,Bakrie Sumatera Plantations Tbk.,https://s3.goapi.io/logo/UNSP.jpg,4262,4262,4262,4262,4262,0,0,0,0,0,-
131,BISI,BISI International Tbk.,https://s3.goapi.io/logo/BISI.jpg,4025,4025,4025,4025,4025,0,0,0,0,0,-
871,TRUK,Guna Timur Raya Tbk.,https://s3.goapi.io/logo/TRUK.jpg,4954,4954,4954,4954,4954,0,0,0,0,0,-
430,JAWA,Jaya Agra Wattie Tbk.,https://s3.goapi.io/logo/JAWA.jpg,1093,1093,1093,1093,1093,0,0,0,0,0,-
158,BPTR,Batavia Prosperindo Trans Tbk.,https://s3.goapi.io/logo/BPTR.jpg,3383,3383,3383,3383,3383,0,0,0,0,0,-
921,WTON,Wijaya Karya Beton Tbk.,https://s3.goapi.io/logo/WTON.jpg,3710,3710,3710,3710,3710,0,0,0,0,0,-
246,DGIK,Nusa Konstruksi Enjiniring Tbk.,https://s3.goapi.io/logo/DGIK.jpg,3944,3944,3944,3944,3944,0,0,0,0,0,-
585,MSKY,MNC Sky Vision Tbk.,https://s3.goapi.io/logo/MSKY.jpg,2862,2862,2862,2862,2862,0,0,0,0,0,-
594,MTSM,Metro Realty Tbk.,https://s3.goapi.io/logo/MTSM.jpg,1313,1313,1313,1313,1313,0,0,0,0,0,-
722,RICY,Ricky Putra Globalindo Tbk,https://s3.goapi.io/logo/RICY.jpg,1619,1619,1619,1619,1619,0,0,0,0,0,-
890,UVCR,Trimegah Karya Pratama Tbk.,https://s3.goapi.io/logo/UVCR.jpg,1793,1793,1793,1793,1793,0,0,0,0,0,-
913,WIRG,WIR ASIA Tbk.,https://s3.goapi.io/logo/WIRG.jpg,4991,4991,4991,4991,4991,0,0,0,0,0,-
345,GZCO,Gozco Plantations Tbk.,https://s3.goapi.io/logo/GZCO.jpg,4864,4864,4864,4864,4864,0,0,0,0,0,-
435,JKON,Jaya Konstruksi Manggala Pratama Tbk.,https://s3.goapi.io/logo/JKON.jpg,2937,2937,2937,2937,2937,0,0,0,0,0,-
721,RGAS,Kian Santang Muliatama Tbk.,https://s3.goapi.io/logo/RGAS.jpg,1928,1928,1928,1928,1928,0,0,0,0,0,-
500,LMPI,Langgeng Makmur Industri Tbk.,https://s3.goapi.io/logo/LMPI.jpg,1858,1858,1858,1858,1858,0,0,0,0,0,-
653,PGJO,Tourindo Guide Indonesia Tbk.,https://s3.goapi.io/logo/PGJO.jpg,4163,4163,4163,4163,4163,0,0,0,0,0,-
431,JAYA,Armada Berjaya Trans Tbk.,https://s3.goapi.io/logo/JAYA.jpg,4901,4901,4901,4901,4901,0,0,0,0,0,-
334,GPRA,Perdana Gapuraprima Tbk.,https://s3.goapi.io/logo/GPRA.jpg,1860,1860,1860,1860,1860,0,0,0,0,0,-
775,SMGA,Sumber Mineral Global Abadi Tbk.,https://s3.goapi.io/logo/SMGA.jpg,2348,2348,2348,2348,2348,0,0,0,0,0,-
608,NETV,Net Visi Media Tbk.,https://s3.goapi.io/logo/NETV.jpg,2216,2216,2216,2216,2216,0,0,0,0,0,-
758,SICO,Sigma Energy Compressindo Tbk.,https://s3.goapi.io/logo/SICO.jpg,3866,3866,3866,3866,3866,0,0,0,0,0,-
810,SULI,SLJ Global Tbk.,https://s3.goapi.io/logo/SULI.jpg,4055,4055,4055,4055,4055,0,0,0,0,0,-
225,CRSN,Carsurin Tbk.,https://s3.goapi.io/logo/CRSN.jpg,3071,3071,3071,3071,3071,0,0,0,0,0,-
648,PEGE,Panca Global Kapital Tbk.,https://s3.goapi.io/logo/PEGE.jpg,3314,3314,3314,3314,3314,0,0,0,0,0,-
684,PRAS,Prima Alloy Steel Universal Tbk.,https://s3.goapi.io/logo/PRAS.jpg,4626,4626,4626,4626,4626,0,0,0,0,0,-
66,ASLC,Autopedia Sukses Lestari Tbk.,https://s3.goapi.io/logo/ASLC.jpg,3159,3159,3159,3159,3159,0,0,0,0,0,-
645,PCAR,Prima Cakrawala Abadi Tbk.,https://s3.goapi.io/logo/PCAR.jpg,4578,4578,4578,4578,4578,0,0,0,0,0,-
304,FITT,Hotel Fitra International Tbk.,https://s3.goapi.io/logo/FITT.jpg,2293,2293,2293,2293,2293,0,0,0,0,0,-
375,IBOS,Indo Boga Sukses Tbk.,https://s3.goapi.io/logo/IBOS.jpg,3877,3877,3877,3877,3877,0,0,0,0,0,-
637,PALM,Provident Investasi Bersama Tbk.,https://s3.goapi.io/logo/PALM.jpg,3478,3478,3478,3478,3478,0,0,0,0,0,-
680,PPGL,Prima Globalindo Logistik Tbk.,https://s3.goapi.io/logo/PPGL.jpg,1831,1831,1831,1831,1831,0,0,0,0,0,-
708,PYFA,Pyridam Farma Tbk,https://s3.goapi.io/logo/PYFA.jpg,2496,2496,2496,2496,2496,0,0,0,0,0,-
893,VICO,Victoria Investama Tbk.,https://s3.goapi.io/logo/VICO.jpg,3766,3766,3766,3766,3766,0,0,0,0,0,-
482,KRAS,Krakatau Steel (Persero) Tbk.,https://s3.goapi.io/logo/KRAS.jpg,3021,3021,3021,3021,3021,0,0,0,0,0,-
86,BAJA,Saranacentral Bajatama Tbk.,https://s3.goapi.io/logo/BAJA.jpg,3283,3283,3283,3283,3283,0,0,0,0,0,-
153,BOLA,Bali Bintang Sejahtera Tbk.,https://s3.goapi.io/logo/BOLA.jpg,2238,2238,2238,2238,2238,0,0,0,0,0,-
603,NASI,Wahana Inti Makmur Tbk.,https://s3.goapi.io/logo/NASI.jpg,2557,2557,2557,2557,2557,0,0,0,0,0,-
745,SCCO,Supreme Cable Manufacturing & Commerce Tbk.,https://s3.goapi.io/logo/SCCO.jpg,2965,2965,2965,2965,2965,0,0,0,0,0,-
269,DWGL,Dwi Guna Laksana Tbk.,https://s3.goapi.io/logo/DWGL.jpg,1099,1099,1099,1099,1099,0,0,0,0,0,-
251,DKFT,Central Omega Resources Tbk.,https://s3.goapi.io/logo/DKFT.jpg,3705,3705,3705,3705,3705,0,0,0,0,0,-
236,DART,Duta Anggada Realty Tbk.,https://s3.goapi.io/logo/DART.jpg,3728,3728,3728,3728,3728,0,0,0,0,0,-
250,DIVA,Distribusi Voucher Nusantara Tbk.,https://s3.goapi.io/logo/DIVA.jpg,4046,4046,4046,4046,4046,0,0,0,0,0,-
270,DYAN,Dyandra Media International Tbk.,https://s3.goapi.io/logo/DYAN.jpg,4371,4371,4371,4371,4371,0,0,0,0,0,-
335,GPSO,Geoprima Solusi Tbk.,https://s3.goapi.io/logo/GPSO.jpg,2414,2414,2414,2414,2414,0,0,0,0,0,-
903,WEHA,WEHA Transportasi Indonesia Tbk.,https://s3.goapi.io/logo/WEHA.jpg,2164,2164,2164,2164,2164,0,0,0,0,0,-
196,CBRE,Cakra Buana Resources Energi Tbk.,https://s3.goapi.io/logo/CBRE.jpg,2175,2175,2175,2175,2175,0,0,0,0,0,-
20,AHAP,Asuransi Harta Aman Pratama Tbk.,https://s3.goapi.io/logo/AHAP.jpg,1605,1605,1605,1605,1605,0,0,0,0,0,-
107,BCIC,Bank JTrust Indonesia Tbk.,https://s3.goapi.io/logo/BCIC.jpg,1717,1717,1717,1717,1717,0,0,0,0,0,-
480,KPIG,MNC Land Tbk.,https://s3.goapi.io/logo/KPIG.jpg,2653,2653,2653,2653,2653,0,0,0,0,0,-
26,AKSI,Mineral Sumberdaya Mandiri Tbk.,https://s3.goapi.io/logo/AKSI.jpg,2483,2483,2483,2483,2483,0,0,0,0,0,-
654,PGLI,Pembangunan Graha Lestari Indah Tbk.,https://s3.goapi.io/logo/PGLI.jpg,2374,2374,2374,2374,2374,0,0,0,0,0,-
348,HAJJ,Arsy Buana Travelindo Tbk.,https://s3.goapi.io/logo/HAJJ.jpg,1317,1317,1317,1317,1317,0,0,0,0,0,-
33,AMAN,Makmur Berkah Amanda Tbk.,https://s3.goapi.io/logo/AMAN.jpg,1474,1474,1474,1474,1474,0,0,0,0,0,-
168,BSML,Bintang Samudera Mandiri Lines Tbk.,https://s3.goapi.io/logo/BSML.jpg,2028,2028,2028,2028,2028,0,0,0,0,0,-
412,IOTF,Sumber Sinergi Makmur Tbk.,https://s3.goapi.io/logo/IOTF.jpg,4633,4633,4633,4633,4633,0,0,0,0,0,-
813,SURE,Super Energy Tbk.,https://s3.goapi.io/logo/SURE.jpg,3338,3338,3338,3338,3338,0,0,0,0,0,-
65,ASJT,Asuransi Jasa Tania Tbk.,https://s3.goapi.io/logo/ASJT.jpg,4672,4672,4672,4672,4672,0,0,0,0,0,-
275,ELIT,Data Sinergitama Jaya Tbk.,https://s3.goapi.io/logo/ELIT.jpg,2579,2579,2579,2579,2579,0,0,0,0,0,-
490,LCGP,Eureka Prima Jakarta Tbk.,https://s3.goapi.io/logo/LCGP.jpg,4118,4118,4118,4118,4118,0,0,0,0,0,-
520,MANG,Manggung Polahraya Tbk.,https://s3.goapi.io/logo/MANG.jpg,4233,4233,4233,4233,4233,0,0,0,0,0,-
629,OKAS,Ancora Indonesia Resources Tbk.,https://s3.goapi.io/logo/OKAS.jpg,2426,2426,2426,2426,2426,0,0,0,0,0,-
22,AISA,FKS Food Sejahtera Tbk.,https://s3.goapi.io/logo/AISA.jpg,2150,2150,2150,2150,2150,0,0,0,0,0,-
410,INTD,Inter Delta Tbk,https://s3.goapi.io/logo/INTD.jpg,1095,1095,1095,1095,1095,0,0,0,0,0,-
178,BUKA,Bukalapak.com Tbk.,https://s3.goapi.io/logo/BUKA.jpg,3657,3657,3657,3657,3657,0,0,0,0,0,-
579,MPXL,MPX Logistics International Tbk.,https://s3.goapi.io/logo/MPXL.jpg,4021,4021,4021,4021,4021,0,0,0,0,0,-
407,INPS,Indah Prakasa Sentosa Tbk.,https://s3.goapi.io/logo/INPS.jpg,1389,1389,1389,1389,1389,0,0,0,0,0,-
453,KDTN,Puri Sentul Permai Tbk.,https://s3.goapi.io/logo/KDTN.jpg,3862,3862,3862,3862,3862,0,0,0,0,0,-
829,TDPM,Tridomain Performance Materials Tbk.,https://s3.goapi.io/logo/TDPM.jpg,2398,2398,2398,2398,2398,0,0,0,0,0,-
80,AYAM,Janu Putra Sejahtera Tbk.,https://s3.goapi.io/logo/AYAM.jpg,1932,1932,1932,1932,1932,0,0,0,0,0,-
341,GTRA,Grahaprima Suksesmandiri Tbk.,https://s3.goapi.io/logo/GTRA.jpg,4442,4442,4442,4442,4442,0,0,0,0,0,-
354,HDTX,Panasia Indo Resources Tbk.,https://s3.goapi.io/logo/HDTX.jpg,1543,1543,1543,1543,1543,0,0,0,0,0,-
564,MKTR,Menthobi Karyatama Raya Tbk.,https://s3.goapi.io/logo/MKTR.jpg,4565,4565,4565,4565,4565,0,0,0,0,0,-
338,GRPM,Graha Prima Mentari Tbk.,https://s3.goapi.io/logo/GRPM.jpg,4912,4912,4912,4912,4912,0,0,0,0,0,-
202,CGAS,Citra Nusantara Gemilang Tbk.,https://s3.goapi.io/logo/CGAS.jpg,1593,1593,1593,1593,1593,0,0,0,0,0,-
833,TFAS,Telefast Indonesia Tbk.,https://s3.goapi.io/logo/TFAS.jpg,1083,1083,1083,1083,1083,0,0,0,0,0,-
905,WICO,Wicaksana Overseas International Tbk.,https://s3.goapi.io/logo/WICO.jpg,4445,4445,4445,4445,4445,0,0,0,0,0,-
458,KICI,Kedaung Indah Can Tbk,https://s3.goapi.io/logo/KICI.jpg,2262,2262,2262,2262,2262,0,0,0,0,0,-
886,UNTD,Terang Dunia Internusa Tbk.,https://s3.goapi.io/logo/UNTD.jpg,4757,4757,4757,4757,4757,0,0,0,0,0,-
901,WAPO,Wahana Pronatural Tbk.,https://s3.goapi.io/logo/WAPO.jpg,2743,2743,2743,2743,2743,0,0,0,0,0,-
254,DMMX,Digital Mediatama Maxima Tbk.,https://s3.goapi.io/logo/DMMX.jpg,1808,1808,1808,1808,1808,0,0,0,0,0,-
554,MHKI,Multi Hanna Kreasindo Tbk.,https://s3.goapi.io/logo/MHKI.jpg,3019,3019,3019,3019,3019,0,0,0,0,0,-
391,INAF,Indofarma Tbk.,https://s3.goapi.io/logo/INAF.jpg,2801,2801,2801,2801,2801,0,0,0,0,0,-
471,KOBX,Kobexindo Tractors Tbk.,https://s3.goapi.io/logo/KOBX.jpg,1006,1006,1006,1006,1006,0,0,0,0,0,-
625,OASA,Maharaksa Biru Energi Tbk.,https://s3.goapi.io/logo/OASA.jpg,2881,2881,2881,2881,2881,0,0,0,0,0,-
750,SDPC,Millennium Pharmacon International Tbk.,https://s3.goapi.io/logo/SDPC.jpg,2384,2384,2384,2384,2384,0,0,0,0,0,-
663,PMJS,Putra Mandiri Jembar Tbk.,https://s3.goapi.io/logo/PMJS.jpg,3728,3728,3728,3728,3728,0,0,0,0,0,-
900,VTNY,Venteny Fortuna International Tbk.,https://s3.goapi.io/logo/VTNY.jpg,3460,3460,3460,3460,3460,0,0,0,0,0,-
897,VKTR,VKTR Teknologi Mobilitas Tbk.,https://s3.goapi.io/logo/VKTR.jpg,3843,3843,3843,3843,3843,0,0,0,0,0,-
84,BACA,Bank Capital Indonesia Tbk.,https://s3.goapi.io/logo/BACA.jpg,3517,3517,3517,3517,3517,0,0,0,0,0,-
510,LRNA,Eka Sari Lorena Transport Tbk.,https://s3.goapi.io/logo/LRNA.jpg,2895,2895,2895,2895,2895,0,0,0,0,0,-
406,INPP,Indonesian Paradise Property Tbk.,https://s3.goapi.io/logo/INPP.jpg,3057,3057,3057,3057,3057,0,0,0,0,0,-
459,KIJA,Kawasan Industri Jababeka Tbk.,https://s3.goapi.io/logo/KIJA.jpg,3383,3383,3383,3383,3383,0,0,0,0,0,-
195,CBPE,Citra Buana Prasida Tbk.,https://s3.goapi.io/logo/CBPE.jpg,1648,1648,1648,1648,1648,0,0,0,0,0,-
876,TYRE,King Tire Indonesia Tbk.,https://s3.goapi.io/logo/TYRE.jpg,4744,4744,4744,4744,4744,0,0,0,0,0,-
44,APEX,Apexindo Pratama Duta Tbk.,https://s3.goapi.io/logo/APEX.jpg,3102,3102,3102,3102,3102,0,0,0,0,0,-
70,ASRI,Alam Sutera Realty Tbk.,https://s3.goapi.io/logo/ASRI.jpg,2750,2750,2750,2750,2750,0,0,0,0,0,-
306,FMII,Fortune Mate Indonesia Tbk,https://s3.goapi.io/logo/FMII.jpg,3518,3518,3518,3518,3518,0,0,0,0,0,-
363,HOKI,Buyung Poetra Sembada Tbk.,https://s3.goapi.io/logo/HOKI.jpg,1902,1902,1902,1902,1902,0,0,0,0,0,-
746,SCMA,Surya Citra Media Tbk.,https://s3.goapi.io/logo/SCMA.jpg,3352,3352,3352,3352,3352,0,0,0,0,0,-
616,NIRO,City Retail Developments Tbk.,https://s3.goapi.io/logo/NIRO.jpg,1651,1651,1651,1651,1651,0,0,0,0,0,-
849,TNCA,Trimuda Nuansa Citra Tbk.,https://s3.goapi.io/logo/TNCA.jpg,4216,4216,4216,4216,4216,0,0,0,0,0,-
466,KLAS,Pelayaran Kurnia Lautan Semesta Tbk.,https://s3.goapi.io/logo/KLAS.jpg,4098,4098,4098,4098,4098,0,0,0,0,0,-
127,BINO,Perma Plasindo Tbk.,https://s3.goapi.io/logo/BINO.jpg,1850,1850,1850,1850,1850,0,0,0,0,0,-
690,PSGO,Palma Serasih Tbk.,https://s3.goapi.io/logo/PSGO.jpg,2485,2485,2485,2485,2485,0,0,0,0,0,-
380,IDPR,Indonesia Pondasi Raya Tbk.,https://s3.goapi.io/logo/IDPR.jpg,3830,3830,3830,3830,3830,0,0,0,0,0,-
344,GWSA,Greenwood Sejahtera Tbk.,https://s3.goapi.io/logo/GWSA.jpg,1918,1918,1918,1918,1918,0,0,0,0,0,-
744,SBMA,Surya Biru Murni Acetylene Tbk.,https://s3.goapi.io/logo/SBMA.jpg,2380,2380,2380,2380,2380,0,0,0,0,0,-
162,BRMS,Bumi Resources Minerals Tbk.,https://s3.goapi.io/logo/BRMS.jpg,1615,1615,1615,1615,1615,0,0,0,0,0,-
742,SATU,Kota Satu Properti Tbk.,https://s3.goapi.io/logo/SATU.jpg,1609,1609,1609,1609,1609,0,0,0,0,0,-
253,DMAS,Puradelta Lestari Tbk.,https://s3.goapi.io/logo/DMAS.jpg,3320,3320,3320,3320,3320,0,0,0,0,0,-
595,MTWI,Malacca Trust Wuwungan Insurance Tbk.,https://s3.goapi.io/logo/MTWI.jpg,1924,1924,1924,1924,1924,0,0,0,0,0,-
929,ZYRX,Zyrexindo Mandiri Buana Tbk.,https://s3.goapi.io/logo/ZYRX.jpg,2718,2718,2718,2718,2718,0,0,0,0,0,-
103,BBSS,Bumi Benowo Sukses Sejahtera Tbk.,https://s3.goapi.io/logo/BBSS.jpg,3909,3909,3909,3909,3909,0,0,0,0,0,-
627,OCAP,Onix Capital Tbk.,https://s3.goapi.io/logo/OCAP.jpg,1605,1605,1605,1605,1605,0,0,0,0,0,-
682,PPRI,Paperocks Indonesia Tbk.,https://s3.goapi.io/logo/PPRI.jpg,2015,2015,2015,2015,2015,0,0,0,0,0,-
747,SCNP,Selaras Citra Nusantara Perkasa Tbk.,https://s3.goapi.io/logo/SCNP.jpg,1736,1736,1736,1736,1736,0,0,0,0,0,-
186,CAKK,Cahayaputra Asa Keramik Tbk.,https://s3.goapi.io/logo/CAKK.jpg,3791,3791,3791,3791,3791,0,0,0,0,0,-
787,SOCI,Soechi Lines Tbk.,https://s3.goapi.io/logo/SOCI.jpg,2715,2715,2715,2715,2715,0,0,0,0,0,-
117,BESS,Batulicin Nusantara Maritim Tbk.,https://s3.goapi.io/logo/BESS.jpg,2623,2623,2623,2623,2623,0,0,0,0,0,-
151,BOBA,Formosa Ingredient Factory Tbk.,https://s3.goapi.io/logo/BOBA.jpg,1543,1543,1543,1543,1543,0,0,0,0,0,-
389,IMJS,Indomobil Multi Jasa Tbk.,https://s3.goapi.io/logo/IMJS.jpg,2902,2902,2902,2902,2902,0,0,0,0,0,-
79,AXIO,Tera Data Indonusa Tbk.,https://s3.goapi.io/logo/AXIO.jpg,4768,4768,4768,4768,4768,0,0,0,0,0,-
249,DILD,Intiland Development Tbk.,https://s3.goapi.io/logo/DILD.jpg,4988,4988,4988,4988,4988,0,0,0,0,0,-
311,FPNI,Lotte Chemical Titan Tbk.,https://s3.goapi.io/logo/FPNI.jpg,1177,1177,1177,1177,1177,0,0,0,0,0,-
50,AREA,Dunia Virtual Online Tbk.,https://s3.goapi.io/logo/AREA.jpg,2147,2147,2147,2147,2147,0,0,0,0,0,-
112,BEEF,Estika Tata Tiara Tbk.,https://s3.goapi.io/logo/BEEF.jpg,4111,4111,4111,4111,4111,0,0,0,0,0,-
266,DUCK,Jaya Bersama Indo Tbk.,https://s3.goapi.io/logo/DUCK.jpg,2774,2774,2774,2774,2774,0,0,0,0,0,-
46,APII,Arita Prima Indonesia Tbk.,https://s3.goapi.io/logo/APII.jpg,1308,1308,1308,1308,1308,0,0,0,0,0,-
735,RUIS,Radiant Utama Interinsco Tbk.,https://s3.goapi.io/logo/RUIS.jpg,2669,2669,2669,2669,2669,0,0,0,0,0,-
766,SKLT,Sekar Laut Tbk.,https://s3.goapi.io/logo/SKLT.jpg,3535,3535,3535,3535,3535,0,0,0,0,0,-
610,NICE,Adhi Kartiko Pratama Tbk.,https://s3.goapi.io/logo/NICE.jpg,2981,2981,2981,2981,2981,0,0,0,0,0,-
898,VOKS,Voksel Electric Tbk.,https://s3.goapi.io/logo/VOKS.jpg,2617,2617,2617,2617,2617,0,0,0,0,0,-
631,OMED,Jayamas Medica Industri Tbk.,https://s3.goapi.io/logo/OMED.jpg,4773,4773,4773,4773,4773,0,0,0,0,0,-
381,IFII,Indonesia Fibreboard Industry Tbk.,https://s3.goapi.io/logo/IFII.jpg,3847,3847,3847,3847,3847,0,0,0,0,0,-
778,SMKL,Satyamitra Kemas Lestari Tbk.,https://s3.goapi.io/logo/SMKL.jpg,1245,1245,1245,1245,1245,0,0,0,0,0,-
336,GRIA,Ingria Pratama Capitalindo Tbk.,https://s3.goapi.io/logo/GRIA.jpg,2839,2839,2839,2839,2839,0,0,0,0,0,-
621,NSSS,Nusantara Sawit Sejahtera Tbk.,https://s3.goapi.io/logo/NSSS.jpg,1685,1685,1685,1685,1685,0,0,0,0,0,-
376,IBST,Inti Bangun Sejahtera Tbk.,https://s3.goapi.io/logo/IBST.jpg,1654,1654,1654,1654,1654,0,0,0,0,0,-
539,MDKI,Emdeki Utama Tbk.,https://s3.goapi.io/logo/MDKI.jpg,4466,4466,4466,4466,4466,0,0,0,0,0,-
867,TRJA,Transkon Jaya Tbk.,https://s3.goapi.io/logo/TRJA.jpg,1450,1450,1450,1450,1450,0,0,0,0,0,-
517,MAHA,Mandiri Herindo Adiperkasa Tbk.,https://s3.goapi.io/logo/MAHA.jpg,1448,1448,1448,1448,1448,0,0,0,0,0,-
326,GLOB,Globe Kita Terang Tbk.,https://s3.goapi.io/logo/GLOB.jpg,2003,2003,2003,2003,2003,0,0,0,0,0,-
289,ERTX,Eratex Djaja Tbk.,https://s3.goapi.io/logo/ERTX.jpg,3148,3148,3148,3148,3148,0,0,0,0,0,-
706,PURI,Puri Global Sukses Tbk.,https://s3.goapi.io/logo/PURI.jpg,2325,2325,2325,2325,2325,0,0,0,0,0,-
456,KETR,Ketrosden Triasmitra Tbk.,https://s3.goapi.io/logo/KETR.jpg,1689,1689,1689,1689,1689,0,0,0,0,0,-
861,TRGU,Cerestar Indonesia Tbk.,https://s3.goapi.io/logo/TRGU.jpg,4415,4415,4415,4415,4415,0,0,0,0,0,-
16,AGAR,Asia Sejahtera Mina Tbk.,https://s3.goapi.io/logo/AGAR.jpg,2425,2425,2425,2425,2425,0,0,0,0,0,-
664,PMMP,Panca Mitra Multiperdana Tbk.,https://s3.goapi.io/logo/PMMP.jpg,4171,4171,4171,4171,4171,0,0,0,0,0,-
695,PTIS,Indo Straits Tbk.,https://s3.goapi.io/logo/PTIS.jpg,4704,4704,4704,4704,4704,0,0,0,0,0,-
688,PSAB,J Resources Asia Pasifik Tbk.,https://s3.goapi.io/logo/PSAB.jpg,2902,2902,2902,2902,2902,0,0,0,0,0,-
920,WSKT,Waskita Karya (Persero) Tbk.,https://s3.goapi.io/logo/WSKT.jpg,4375,4375,4375,4375,4375,0,0,0,0,0,-
909,WIKA,Wijaya Karya (Persero) Tbk.,https://s3.goapi.io/logo/WIKA.jpg,2127,2127,2127,2127,2127,0,0,0,0,0,-
247,DGNS,Diagnos Laboratorium Utama Tbk.,https://s3.goapi.io/logo/DGNS.jpg,1999,1999,1999,1999,1999,0,0,0,0,0,-
424,ITIC,Indonesian Tobacco Tbk.,https://s3.goapi.io/logo/ITIC.jpg,2723,2723,2723,2723,2723,0,0,0,0,0,-
313,FUJI,Fuji Finance Indonesia Tbk.,https://s3.goapi.io/logo/FUJI.jpg,3124,3124,3124,3124,3124,0,0,0,0,0,-
701,PTSN,Sat Nusapersada Tbk,https://s3.goapi.io/logo/PTSN.jpg,3672,3672,3672,3672,3672,0,0,0,0,0,-
149,BNII,Bank Maybank Indonesia Tbk.,https://s3.goapi.io/logo/BNII.jpg,2345,2345,2345,2345,2345,0,0,0,0,0,-
347,HAIS,Hasnur Internasional Shipping Tbk.,https://s3.goapi.io/logo/HAIS.jpg,2882,2882,2882,2882,2882,0,0,0,0,0,-
731,RONY,Aesler Grup Internasional Tbk.,https://s3.goapi.io/logo/RONY.jpg,4118,4118,4118,4118,4118,0,0,0,0,0,-
733,RSCH,Charlie Hospital Semarang Tbk.,https://s3.goapi.io/logo/RSCH.jpg,3773,3773,3773,3773,3773,0,0,0,0,0,-
237,DATA,Remala Abadi Tbk.,https://s3.goapi.io/logo/DATA.jpg,1365,1365,1365,1365,1365,0,0,0,0,0,-
216,CNMA,Nusantara Sejahtera Raya Tbk.,https://s3.goapi.io/logo/CNMA.jpg,3836,3836,3836,3836,3836,0,0,0,0,0,-
34,AMAR,Bank Amar Indonesia Tbk.,https://s3.goapi.io/logo/AMAR.jpg,2035,2035,2035,2035,2035,0,0,0,0,0,-
486,LABA,Ladangbaja Murni Tbk.,https://s3.goapi.io/logo/LABA.jpg,4255,4255,4255,4255,4255,0,0,0,0,0,-
855,TOTO,Surya Toto Indonesia Tbk.,https://s3.goapi.io/logo/TOTO.jpg,1858,1858,1858,1858,1858,0,0,0,0,0,-
274,EKAD,Ekadharma International Tbk.,https://s3.goapi.io/logo/EKAD.jpg,2367,2367,2367,2367,2367,0,0,0,0,0,-
703,PUDP,Pudjiadi Prestige Tbk.,https://s3.goapi.io/logo/PUDP.jpg,4004,4004,4004,4004,4004,0,0,0,0,0,-
145,BMTR,Global Mediacom Tbk.,https://s3.goapi.io/logo/BMTR.jpg,4409,4409,4409,4409,4409,0,0,0,0,0,-
113,BEER,Jobubu Jarum Minahasa Tbk.,https://s3.goapi.io/logo/BEER.jpg,4256,4256,4256,4256,4256,0,0,0,0,0,-
507,LPLI,Star Pacific Tbk,https://s3.goapi.io/logo/LPLI.jpg,2271,2271,2271,2271,2271,0,0,0,0,0,-
728,RMKO,Royaltama Mulia Kontraktorindo Tbk.,https://s3.goapi.io/logo/RMKO.jpg,2089,2089,2089,2089,2089,0,0,0,0,0,-
880,UFOE,Damai Sejahtera Abadi Tbk.,https://s3.goapi.io/logo/UFOE.jpg,2095,2095,2095,2095,2095,0,0,0,0,0,-
771,SMBR,Semen Baturaja Tbk.,https://s3.goapi.io/logo/SMBR.jpg,4050,4050,4050,4050,4050,0,0,0,0,0,-
646,PDES,Destinasi Tirta Nusantara Tbk,https://s3.goapi.io/logo/PDES.jpg,4256,4256,4256,4256,4256,0,0,0,0,0,-
105,BBYB,Bank Neo Commerce Tbk.,https://s3.goapi.io/logo/BBYB.jpg,1483,1483,1483,1483,1483,0,0,0,0,0,-
593,MTRA,Mitra Pemuda Tbk.,https://s3.goapi.io/logo/MTRA.jpg,2978,2978,2978,2978,2978,0,0,0,0,0,-
476,KOPI,Mitra Energi Persada Tbk.,https://s3.goapi.io/logo/KOPI.jpg,1467,1467,1467,1467,1467,0,0,0,0,0,-
739,SAME,Sarana Meditama Metropolitan Tbk.,https://s3.goapi.io/logo/SAME.jpg,1418,1418,1418,1418,1418,0,0,0,0,0,-
52,ARII,Atlas Resources Tbk.,https://s3.goapi.io/logo/ARII.jpg,2368,2368,2368,2368,2368,0,0,0,0,0,-
288,ERAL,Sinar Eka Selaras Tbk.,https://s3.goapi.io/logo/ERAL.jpg,3939,3939,3939,3939,3939,0,0,0,0,0,-
470,KMTR,Kirana Megatara Tbk.,https://s3.goapi.io/logo/KMTR.jpg,4354,4354,4354,4354,4354,0,0,0,0,0,-
545,MEJA,Harta Djaya Karya Tbk.,https://s3.goapi.io/logo/MEJA.jpg,1624,1624,1624,1624,1624,0,0,0,0,0,-
863,TRIM,Trimegah Sekuritas Indonesia Tbk.,https://s3.goapi.io/logo/TRIM.jpg,2126,2126,2126,2126,2126,0,0,0,0,0,-
208,CLAY,Citra Putra Realty Tbk.,https://s3.goapi.io/logo/CLAY.jpg,3377,3377,3377,3377,3377,0,0,0,0,0,-
350,HATM,Habco Trans Maritima Tbk.,https://s3.goapi.io/logo/HATM.jpg,3953,3953,3953,3953,3953,0,0,0,0,0,-
850,TOBA,TBS Energi Utama Tbk.,https://s3.goapi.io/logo/TOBA.jpg,1350,1350,1350,1350,1350,0,0,0,0,0,-
427,JARR,Jhonlin Agro Raya Tbk.,https://s3.goapi.io/logo/JARR.jpg,2404,2404,2404,2404,2404,0,0,0,0,0,-
449,KBLM,Kabelindo Murni Tbk.,https://s3.goapi.io/logo/KBLM.jpg,3789,3789,3789,3789,3789,0,0,0,0,0,-
650,PEVE,Penta Valent Tbk.,https://s3.goapi.io/logo/PEVE.jpg,1150,1150,1150,1150,1150,0,0,0,0,0,-
626,OBMD,OBM Drilchem Tbk.,https://s3.goapi.io/logo/OBMD.jpg,2778,2778,2778,2778,2778,0,0,0,0,0,-
234,CYBR,ITSEC Asia Tbk.,https://s3.goapi.io/logo/CYBR.jpg,4447,4447,4447,4447,4447,0,0,0,0,0,-
224,CRAB,Toba Surimi Industries Tbk.,https://s3.goapi.io/logo/CRAB.jpg,2868,2868,2868,2868,2868,0,0,0,0,0,-
177,BUDI,Budi Starch & Sweetener Tbk.,https://s3.goapi.io/logo/BUDI.jpg,1755,1755,1755,1755,1755,0,0,0,0,0,-
773,SMDM,Suryamas Dutamakmur Tbk.,https://s3.goapi.io/logo/SMDM.jpg,1367,1367,1367,1367,1367,0,0,0,0,0,-
272,ECII,Electronic City Indonesia Tbk.,https://s3.goapi.io/logo/ECII.jpg,4204,4204,4204,4204,4204,0,0,0,0,0,-
415,IPCM,Jasa Armada Indonesia Tbk.,https://s3.goapi.io/logo/IPCM.jpg,2364,2364,2364,2364,2364,0,0,0,0,0,-
793,SOTS,Satria Mega Kencana Tbk.,https://s3.goapi.io/logo/SOTS.jpg,3532,3532,3532,3532,3532,0,0,0,0,0,-
443,JTPE,Jasuindo Tiga Perkasa Tbk.,https://s3.goapi.io/logo/JTPE.jpg,2665,2665,2665,2665,2665,0,0,0,0,0,-
529,MAYA,Bank Mayapada Internasional Tbk.,https://s3.goapi.io/logo/MAYA.jpg,3915,3915,3915,3915,3915,0,0,0,0,0,-
923,YPAS,Yanaprima Hastapersada Tbk,https://s3.goapi.io/logo/YPAS.jpg,3011,3011,3011,3011,3011,0,0,0,0,0,-
716,RCCC,Utama Radar Cahaya Tbk.,https://s3.goapi.io/logo/RCCC.jpg,4933,4933,4933,4933,4933,0,0,0,0,0,-
319,GEMA,Gema Grahasarana Tbk.,https://s3.goapi.io/logo/GEMA.jpg,2772,2772,2772,2772,2772,0,0,0,0,0,-
423,ISSP,Steel Pipe Industry of Indonesia Tbk.,https://s3.goapi.io/logo/ISSP.jpg,3152,3152,3152,3152,3152,0,0,0,0,0,-
615,NIPS,Nipress Tbk.,https://s3.goapi.io/logo/NIPS.jpg,3069,3069,3069,3069,3069,0,0,0,0,0,-
644,PBSA,Paramita Bangun Sarana Tbk.,https://s3.goapi.io/logo/PBSA.jpg,3872,3872,3872,3872,3872,0,0,0,0,0,-
276,ELPI,Pelayaran Nasional Ekalya Purnamasari Tbk.,https://s3.goapi.io/logo/ELPI.jpg,2652,2652,2652,2652,2652,0,0,0,0,0,-
434,JIHD,Jakarta International Hotels & Development Tbk.,https://s3.goapi.io/logo/JIHD.jpg,3793,3793,3793,3793,3793,0,0,0,0,0,-
777,SMIL,Sarana Mitra Luas Tbk.,https://s3.goapi.io/logo/SMIL.jpg,1374,1374,1374,1374,1374,0,0,0,0,0,-
142,BMHS,Bundamedik Tbk.,https://s3.goapi.io/logo/BMHS.jpg,4378,4378,4378,4378,4378,0,0,0,0,0,-
561,MKAP,Multikarya Asia Pasifik Raya Tbk.,https://s3.goapi.io/logo/MKAP.jpg,2414,2414,2414,2414,2414,0,0,0,0,0,-
491,LCKM,LCK Global Kedaton Tbk.,https://s3.goapi.io/logo/LCKM.jpg,3929,3929,3929,3929,3929,0,0,0,0,0,-
360,HITS,Humpuss Intermoda Transportasi Tbk.,https://s3.goapi.io/logo/HITS.jpg,3261,3261,3261,3261,3261,0,0,0,0,0,-
795,SPMA,Suparma Tbk.,https://s3.goapi.io/logo/SPMA.jpg,1605,1605,1605,1605,1605,0,0,0,0,0,-
78,AWAN,Era Digital Media Tbk.,https://s3.goapi.io/logo/AWAN.jpg,1699,1699,1699,1699,1699,0,0,0,0,0,-
340,GTBO,Garda Tujuh Buana Tbk,https://s3.goapi.io/logo/GTBO.jpg,1416,1416,1416,1416,1416,0,0,0,0,0,-
767,SKRN,Superkrane Mitra Utama Tbk.,https://s3.goapi.io/logo/SKRN.jpg,3303,3303,3303,3303,3303,0,0,0,0,0,-
505,LPIN,Multi Prima Sejahtera Tbk,https://s3.goapi.io/logo/LPIN.jpg,3409,3409,3409,3409,3409,0,0,0,0,0,-
669,PNLF,Panin Financial Tbk.,https://s3.goapi.io/logo/PNLF.jpg,4491,4491,4491,4491,4491,0,0,0,0,0,-
32,AMAG,Asuransi Multi Artha Guna Tbk.,https://s3.goapi.io/logo/AMAG.jpg,2589,2589,2589,2589,2589,0,0,0,0,0,-
765,SKBM,Sekar Bumi Tbk.,https://s3.goapi.io/logo/SKBM.jpg,4580,4580,4580,4580,4580,0,0,0,0,0,-
926,ZBRA,Dosni Roha Indonesia Tbk.,https://s3.goapi.io/logo/ZBRA.jpg,1608,1608,1608,1608,1608,0,0,0,0,0,-
29,ALKA,Alakasa Industrindo Tbk,https://s3.goapi.io/logo/ALKA.jpg,2932,2932,2932,2932,2932,0,0,0,0,0,-
144,BMSR,Bintang Mitra Semestaraya Tbk,https://s3.goapi.io/logo/BMSR.jpg,3600,3600,3600,3600,3600,0,0,0,0,0,-
571,MNCN,Media Nusantara Citra Tbk.,https://s3.goapi.io/logo/MNCN.jpg,1987,1987,1987,1987,1987,0,0,0,0,0,-
817,TALF,Tunas Alfin Tbk.,https://s3.goapi.io/logo/TALF.jpg,4030,4030,4030,4030,4030,0,0,0,0,0,-
28,ALII,Ancara Logistics Indonesia Tbk.,https://s3.goapi.io/logo/ALII.jpg,3150,3150,3150,3150,3150,0,0,0,0,0,-
584,MSJA,Multi Spunindo Jaya Tbk.,https://s3.goapi.io/logo/MSJA.jpg,4928,4928,4928,4928,4928,0,0,0,0,0,-
74,ATIC,Anabatic Technologies Tbk.,https://s3.goapi.io/logo/ATIC.jpg,3090,3090,3090,3090,3090,0,0,0,0,0,-
655,PGUN,Pradiksi Gunatama Tbk.,https://s3.goapi.io/logo/PGUN.jpg,3566,3566,3566,3566,3566,0,0,0,0,0,-
620,NRCA,Nusa Raya Cipta Tbk.,https://s3.goapi.io/logo/NRCA.jpg,4641,4641,4641,4641,4641,0,0,0,0,0,-
774,SMDR,Samudera Indonesia  Tbk.,https://s3.goapi.io/logo/SMDR.jpg,1761,1761,1761,1761,1761,0,0,0,0,0,-
156,BPFI,Woori Finance Indonesia Tbk.,https://s3.goapi.io/logo/BPFI.jpg,4131,4131,4131,4131,4131,0,0,0,0,0,-
390,IMPC,Impack Pratama Industri Tbk.,https://s3.goapi.io/logo/IMPC.jpg,4753,4753,4753,4753,4753,0,0,0,0,0,-
649,PEHA,Phapros Tbk.,https://s3.goapi.io/logo/PEHA.jpg,1385,1385,1385,1385,1385,0,0,0,0,0,-
659,PKPK,Perdana Karya Perkasa Tbk,https://s3.goapi.io/logo/PKPK.jpg,4298,4298,4298,4298,4298,0,0,0,0,0,-
590,MTLA,Metropolitan Land Tbk.,https://s3.goapi.io/logo/MTLA.jpg,1015,1015,1015,1015,1015,0,0,0,0,0,-
242,DEPO,Caturkarda Depo Bangunan Tbk.,https://s3.goapi.io/logo/DEPO.jpg,3716,3716,3716,3716,3716,0,0,0,0,0,-
916,WOMF,Wahana Ottomitra Multiartha Tbk.,https://s3.goapi.io/logo/WOMF.jpg,1709,1709,1709,1709,1709,0,0,0,0,0,-
21,AIMS,Akbar Indo Makmur Stimec Tbk,https://s3.goapi.io/logo/AIMS.jpg,2451,2451,2451,2451,2451,0,0,0,0,0,-
804,SSTM,Sunson Textile Manufacture Tbk,https://s3.goapi.io/logo/SSTM.jpg,3444,3444,3444,3444,3444,0,0,0,0,0,-
566,MLIA,Mulia Industrindo Tbk,https://s3.goapi.io/logo/MLIA.jpg,3869,3869,3869,3869,3869,0,0,0,0,0,-
327,GLVA,Galva Technologies Tbk.,https://s3.goapi.io/logo/GLVA.jpg,4754,4754,4754,4754,4754,0,0,0,0,0,-
238,DAYA,Duta Intidaya Tbk.,https://s3.goapi.io/logo/DAYA.jpg,2993,2993,2993,2993,2993,0,0,0,0,0,-
676,POOL,Pool Advista Indonesia Tbk.,https://s3.goapi.io/logo/POOL.jpg,2833,2833,2833,2833,2833,0,0,0,0,0,-
71,ASRM,Asuransi Ramayana Tbk.,https://s3.goapi.io/logo/ASRM.jpg,3366,3366,3366,3366,3366,0,0,0,0,0,-
840,TIRA,Tira Austenite Tbk,https://s3.goapi.io/logo/TIRA.jpg,4499,4499,4499,4499,4499,0,0,0,0,0,-
260,DPNS,Duta Pertiwi Nusantara Tbk.,https://s3.goapi.io/logo/DPNS.jpg,1887,1887,1887,1887,1887,0,0,0,0,0,-
697,PTPP,PP (Persero) Tbk.,https://s3.goapi.io/logo/PTPP.jpg,1269,1269,1269,1269,1269,0,0,0,0,0,-
762,SIMP,Salim Ivomas Pratama Tbk.,https://s3.goapi.io/logo/SIMP.jpg,3054,3054,3054,3054,3054,0,0,0,0,0,-
49,ARCI,Archi Indonesia Tbk.,https://s3.goapi.io/logo/ARCI.jpg,1428,1428,1428,1428,1428,0,0,0,0,0,-
501,LMSH,Lionmesh Prima Tbk.,https://s3.goapi.io/logo/LMSH.jpg,2356,2356,2356,2356,2356,0,0,0,0,0,-
369,HRTA,Hartadinata Abadi Tbk.,https://s3.goapi.io/logo/HRTA.jpg,3474,3474,3474,3474,3474,0,0,0,0,0,-
448,KBLI,KMI Wire & Cable Tbk.,https://s3.goapi.io/logo/KBLI.jpg,3570,3570,3570,3570,3570,0,0,0,0,0,-
287,ERAA,Erajaya Swasembada Tbk.,https://s3.goapi.io/logo/ERAA.jpg,3197,3197,3197,3197,3197,0,0,0,0,0,-
707,PWON,Pakuwon Jati Tbk.,https://s3.goapi.io/logo/PWON.jpg,2170,2170,2170,2170,2170,0,0,0,0,0,-
173,BTON,Betonjaya Manunggal Tbk.,https://s3.goapi.io/logo/BTON.jpg,2565,2565,2565,2565,2565,0,0,0,0,0,-
674,POLU,Golden Flower Tbk.,https://s3.goapi.io/logo/POLU.jpg,3212,3212,3212,3212,3212,0,0,0,0,0,-
692,PSSI,IMC Pelita Logistik Tbk.,https://s3.goapi.io/logo/PSSI.jpg,1101,1101,1101,1101,1101,0,0,0,0,0,-
280,EMTK,Elang Mahkota Teknologi Tbk.,https://s3.goapi.io/logo/EMTK.jpg,3748,3748,3748,3748,3748,0,0,0,0,0,-
865,TRIO,Trikomsel Oke Tbk.,https://s3.goapi.io/logo/TRIO.jpg,1424,1424,1424,1424,1424,0,0,0,0,0,-
872,TRUS,Trust Finance Indonesia Tbk,https://s3.goapi.io/logo/TRUS.jpg,2355,2355,2355,2355,2355,0,0,0,0,0,-
556,MIDI,Midi Utama Indonesia Tbk.,https://s3.goapi.io/logo/MIDI.jpg,2652,2652,2652,2652,2652,0,0,0,0,0,-
792,SOSS,Shield On Service Tbk.,https://s3.goapi.io/logo/SOSS.jpg,3787,3787,3787,3787,3787,0,0,0,0,0,-
713,RALS,Ramayana Lestari Sentosa Tbk.,https://s3.goapi.io/logo/RALS.jpg,4546,4546,4546,4546,4546,0,0,0,0,0,-
632,OMRE,Indonesia Prima Property Tbk,https://s3.goapi.io/logo/OMRE.jpg,1436,1436,1436,1436,1436,0,0,0,0,0,-
27,ALDO,Alkindo Naratama Tbk.,https://s3.goapi.io/logo/ALDO.jpg,2248,2248,2248,2248,2248,0,0,0,0,0,-
481,KRAH,Grand Kartech Tbk.,https://s3.goapi.io/logo/KRAH.jpg,3514,3514,3514,3514,3514,0,0,0,0,0,-
573,MORA,Mora Telematika Indonesia Tbk.,https://s3.goapi.io/logo/MORA.jpg,2462,2462,2462,2462,2462,0,0,0,0,0,-
387,IKBI,Sumi Indo Kabel Tbk.,https://s3.goapi.io/logo/IKBI.jpg,3893,3893,3893,3893,3893,0,0,0,0,0,-
115,BELI,Global Digital Niaga Tbk.,https://s3.goapi.io/logo/BELI.jpg,1700,1700,1700,1700,1700,0,0,0,0,0,-
673,POLL,Pollux Properties Indonesia Tbk.,https://s3.goapi.io/logo/POLL.jpg,2072,2072,2072,2072,2072,0,0,0,0,0,-
670,PNSE,Pudjiadi & Sons Tbk.,https://s3.goapi.io/logo/PNSE.jpg,4223,4223,4223,4223,4223,0,0,0,0,0,-
710,RAAM,Tripar Multivision Plus Tbk.,https://s3.goapi.io/logo/RAAM.jpg,2984,2984,2984,2984,2984,0,0,0,0,0,-
419,IRRA,Itama Ranoraya Tbk.,https://s3.goapi.io/logo/IRRA.jpg,2279,2279,2279,2279,2279,0,0,0,0,0,-
607,NELY,Pelayaran Nelly Dwi Putri Tbk.,https://s3.goapi.io/logo/NELY.jpg,2092,2092,2092,2092,2092,0,0,0,0,0,-
548,META,Nusantara Infrastructure Tbk.,https://s3.goapi.io/logo/META.jpg,4823,4823,4823,4823,4823,0,0,0,0,0,-
751,SDRA,Bank Woori Saudara Indonesia 1906 Tbk.,https://s3.goapi.io/logo/SDRA.jpg,1996,1996,1996,1996,1996,0,0,0,0,0,-
77,AVIA,Avia Avian Tbk.,https://s3.goapi.io/logo/AVIA.jpg,4014,4014,4014,4014,4014,0,0,0,0,0,-
226,CSAP,Catur Sentosa Adiprana Tbk.,https://s3.goapi.io/logo/CSAP.jpg,4255,4255,4255,4255,4255,0,0,0,0,0,-
642,PBID,Panca Budi Idaman Tbk.,https://s3.goapi.io/logo/PBID.jpg,4127,4127,4127,4127,4127,0,0,0,0,0,-
61,ASDM,Asuransi Dayin Mitra Tbk.,https://s3.goapi.io/logo/ASDM.jpg,3150,3150,3150,3150,3150,0,0,0,0,0,-
469,KMDS,Kurniamitra Duta Sentosa Tbk.,https://s3.goapi.io/logo/KMDS.jpg,2081,2081,2081,2081,2081,0,0,0,0,0,-
312,FREN,Smartfren Telecom Tbk.,https://s3.goapi.io/logo/FREN.jpg,4400,4400,4400,4400,4400,0,0,0,0,0,-
555,MICE,Multi Indocitra Tbk.,https://s3.goapi.io/logo/MICE.jpg,1534,1534,1534,1534,1534,0,0,0,0,0,-
838,TIFA,KDB Tifa Finance Tbk.,https://s3.goapi.io/logo/TIFA.jpg,1345,1345,1345,1345,1345,0,0,0,0,0,-
383,IGAR,Champion Pacific Indonesia Tbk.,https://s3.goapi.io/logo/IGAR.jpg,4473,4473,4473,4473,4473,0,0,0,0,0,-
140,BMAS,Bank Maspion Indonesia Tbk.,https://s3.goapi.io/logo/BMAS.jpg,4725,4725,4725,4725,4725,0,0,0,0,0,-
811,SUNI,Sunindo Pratama Tbk.,https://s3.goapi.io/logo/SUNI.jpg,4459,4459,4459,4459,4459,0,0,0,0,0,-
877,UANG,Pakuan Tbk.,https://s3.goapi.io/logo/UANG.jpg,2939,2939,2939,2939,2939,0,0,0,0,0,-
796,SPTO,Surya Pertiwi Tbk.,https://s3.goapi.io/logo/SPTO.jpg,1476,1476,1476,1476,1476,0,0,0,0,0,-
786,SNLK,Sunter Lakeside Hotel Tbk.,https://s3.goapi.io/logo/SNLK.jpg,1651,1651,1651,1651,1651,0,0,0,0,0,-
580,MRAT,Mustika Ratu Tbk.,https://s3.goapi.io/logo/MRAT.jpg,4716,4716,4716,4716,4716,0,0,0,0,0,-
783,SMRA,Summarecon Agung Tbk.,https://s3.goapi.io/logo/SMRA.jpg,4830,4830,4830,4830,4830,0,0,0,0,0,-
133,BJTM,Bank Pembangunan Daerah Jawa Timur Tbk.,https://s3.goapi.io/logo/BJTM.jpg,4088,4088,4088,4088,4088,0,0,0,0,0,-
157,BPII,Batavia Prosperindo Internasional Tbk.,https://s3.goapi.io/logo/BPII.jpg,1170,1170,1170,1170,1170,0,0,0,0,0,-
394,INCI,Intanwijaya Internasional Tbk,https://s3.goapi.io/logo/INCI.jpg,2959,2959,2959,2959,2959,0,0,0,0,0,-
465,KKGI,Resource Alam Indonesia Tbk.,https://s3.goapi.io/logo/KKGI.jpg,3420,3420,3420,3420,3420,0,0,0,0,0,-
647,PDPP,Primadaya Plastisindo Tbk.,https://s3.goapi.io/logo/PDPP.jpg,3109,3109,3109,3109,3109,0,0,0,0,0,-
714,RANC,Supra Boga Lestari Tbk.,https://s3.goapi.io/logo/RANC.jpg,1728,1728,1728,1728,1728,0,0,0,0,0,-
895,VISI,Satu Visi Putra Tbk.,https://s3.goapi.io/logo/VISI.jpg,1572,1572,1572,1572,1572,0,0,0,0,0,-
531,MBMA,Merdeka Battery Materials Tbk.,https://s3.goapi.io/logo/MBMA.jpg,4381,4381,4381,4381,4381,0,0,0,0,0,-
163,BRNA,Berlina Tbk.,https://s3.goapi.io/logo/BRNA.jpg,3476,3476,3476,3476,3476,0,0,0,0,0,-
24,AKPI,Argha Karya Prima Industry Tbk.,https://s3.goapi.io/logo/AKPI.jpg,3230,3230,3230,3230,3230,0,0,0,0,0,-
444,KAEF,Kimia Farma Tbk.,https://s3.goapi.io/logo/KAEF.jpg,4735,4735,4735,4735,4735,0,0,0,0,0,-
727,RMKE,RMK Energy Tbk.,https://s3.goapi.io/logo/RMKE.jpg,4649,4649,4649,4649,4649,0,0,0,0,0,-
432,JECC,Jembo Cable Company Tbk.,https://s3.goapi.io/logo/JECC.jpg,3272,3272,3272,3272,3272,0,0,0,0,0,-
618,NOBU,Bank Nationalnobu Tbk.,https://s3.goapi.io/logo/NOBU.jpg,4256,4256,4256,4256,4256,0,0,0,0,0,-
834,TFCO,Tifico Fiber Indonesia Tbk.,https://s3.goapi.io/logo/TFCO.jpg,4880,4880,4880,4880,4880,0,0,0,0,0,-
784,SMRU,SMR Utama Tbk.,https://s3.goapi.io/logo/SMRU.jpg,1719,1719,1719,1719,1719,0,0,0,0,0,-
820,TAPG,Triputra Agro Persada Tbk.,https://s3.goapi.io/logo/TAPG.jpg,1919,1919,1919,1919,1919,0,0,0,0,0,-
439,JRPT,Jaya Real Property Tbk.,https://s3.goapi.io/logo/JRPT.jpg,2280,2280,2280,2280,2280,0,0,0,0,0,-
97,BBLD,Buana Finance Tbk.,https://s3.goapi.io/logo/BBLD.jpg,1337,1337,1337,1337,1337,0,0,0,0,0,-
229,CSRA,Cisadane Sawit Raya Tbk.,https://s3.goapi.io/logo/CSRA.jpg,4067,4067,4067,4067,4067,0,0,0,0,0,-
587,MTDL,Metrodata Electronics Tbk.,https://s3.goapi.io/logo/MTDL.jpg,1195,1195,1195,1195,1195,0,0,0,0,0,-
658,PJAA,Pembangunan Jaya Ancol Tbk.,https://s3.goapi.io/logo/PJAA.jpg,1530,1530,1530,1530,1530,0,0,0,0,0,-
588,MTEL,Dayamitra Telekomunikasi Tbk.,https://s3.goapi.io/logo/MTEL.jpg,1709,1709,1709,1709,1709,0,0,0,0,0,-
414,IPCC,Indonesia Kendaraan Terminal Tbk.,https://s3.goapi.io/logo/IPCC.jpg,2369,2369,2369,2369,2369,0,0,0,0,0,-
362,HMSP,H.M. Sampoerna Tbk.,https://s3.goapi.io/logo/HMSP.jpg,2014,2014,2014,2014,2014,0,0,0,0,0,-
859,TPMA,Trans Power Marine Tbk.,https://s3.goapi.io/logo/TPMA.jpg,4024,4024,4024,4024,4024,0,0,0,0,0,-
772,SMCB,Solusi Bangun Indonesia Tbk.,https://s3.goapi.io/logo/SMCB.jpg,3329,3329,3329,3329,3329,0,0,0,0,0,-
425,ITMA,Sumber Energi Andalan Tbk.,https://s3.goapi.io/logo/ITMA.jpg,2248,2248,2248,2248,2248,0,0,0,0,0,-
454,KEEN,Kencana Energi Lestari Tbk.,https://s3.goapi.io/logo/KEEN.jpg,3313,3313,3313,3313,3313,0,0,0,0,0,-
550,MFMI,Multifiling Mitra Indonesia Tbk.,https://s3.goapi.io/logo/MFMI.jpg,3422,3422,3422,3422,3422,0,0,0,0,0,-
56,ARNA,Arwana Citramulia Tbk.,https://s3.goapi.io/logo/ARNA.jpg,1166,1166,1166,1166,1166,0,0,0,0,0,-
264,DSNG,Dharma Satya Nusantara Tbk.,https://s3.goapi.io/logo/DSNG.jpg,3358,3358,3358,3358,3358,0,0,0,0,0,-
255,DMND,Diamond Food Indonesia Tbk.,https://s3.goapi.io/logo/DMND.jpg,4929,4929,4929,4929,4929,0,0,0,0,0,-
759,SIDO,Industri Jamu dan Farmasi Sido Muncul Tbk.,https://s3.goapi.io/logo/SIDO.jpg,2503,2503,2503,2503,2503,0,0,0,0,0,-
830,TEBE,Dana Brata Luhur Tbk.,https://s3.goapi.io/logo/TEBE.jpg,3625,3625,3625,3625,3625,0,0,0,0,0,-
39,AMOR,Ashmore Asset Management Indonesia Tbk.,https://s3.goapi.io/logo/AMOR.jpg,4893,4893,4893,4893,4893,0,0,0,0,0,-
521,MAPA,Map Aktif Adiperkasa Tbk.,https://s3.goapi.io/logo/MAPA.jpg,4009,4009,4009,4009,4009,0,0,0,0,0,-
258,DOID,Delta Dunia Makmur Tbk.,https://s3.goapi.io/logo/DOID.jpg,1403,1403,1403,1403,1403,0,0,0,0,0,-
503,LPCK,Lippo Cikarang Tbk,https://s3.goapi.io/logo/LPCK.jpg,2895,2895,2895,2895,2895,0,0,0,0,0,-
445,KARW,ICTSI Jasa Prima Tbk.,https://s3.goapi.io/logo/KARW.jpg,3984,3984,3984,3984,3984,0,0,0,0,0,-
42,ANJT,Austindo Nusantara Jaya Tbk.,https://s3.goapi.io/logo/ANJT.jpg,2276,2276,2276,2276,2276,0,0,0,0,0,-
672,POLI,Pollux Hotels Group Tbk.,https://s3.goapi.io/logo/POLI.jpg,3182,3182,3182,3182,3182,0,0,0,0,0,-
72,ASSA,Adi Sarana Armada Tbk.,https://s3.goapi.io/logo/ASSA.jpg,1870,1870,1870,1870,1870,0,0,0,0,0,-
62,ASGR,Astra Graphia Tbk.,https://s3.goapi.io/logo/ASGR.jpg,2958,2958,2958,2958,2958,0,0,0,0,0,-
343,GULA,Aman Agrindo Tbk.,https://s3.goapi.io/logo/GULA.jpg,1384,1384,1384,1384,1384,0,0,0,0,0,-
152,BOGA,Bintang Oto Global Tbk.,https://s3.goapi.io/logo/BOGA.jpg,3857,3857,3857,3857,3857,0,0,0,0,0,-
167,BSIM,Bank Sinarmas Tbk.,https://s3.goapi.io/logo/BSIM.jpg,1137,1137,1137,1137,1137,0,0,0,0,0,-
740,SAMF,Saraswanti Anugerah Makmur Tbk.,https://s3.goapi.io/logo/SAMF.jpg,2033,2033,2033,2033,2033,0,0,0,0,0,-
60,ASBI,Asuransi Bintang Tbk.,https://s3.goapi.io/logo/ASBI.jpg,3643,3643,3643,3643,3643,0,0,0,0,0,-
88,BANK,Bank Aladin Syariah Tbk.,https://s3.goapi.io/logo/BANK.jpg,3748,3748,3748,3748,3748,0,0,0,0,0,-
109,BDKR,Berdikari Pondasi Perkasa Tbk.,https://s3.goapi.io/logo/BDKR.jpg,1106,1106,1106,1106,1106,0,0,0,0,0,-
826,TBMS,Tembaga Mulia Semanan Tbk.,https://s3.goapi.io/logo/TBMS.jpg,1823,1823,1823,1823,1823,0,0,0,0,0,-
475,KONI,Perdana Bangun Pusaka Tbk,https://s3.goapi.io/logo/KONI.jpg,3535,3535,3535,3535,3535,0,0,0,0,0,-
511,LSIP,PP London Sumatra Indonesia Tbk.,https://s3.goapi.io/logo/LSIP.jpg,3768,3768,3768,3768,3768,0,0,0,0,0,-
734,RSGK,Kedoya Adyaraya Tbk.,https://s3.goapi.io/logo/RSGK.jpg,4092,4092,4092,4092,4092,0,0,0,0,0,-
878,UCID,Uni-Charm Indonesia Tbk.,https://s3.goapi.io/logo/UCID.jpg,2856,2856,2856,2856,2856,0,0,0,0,0,-
668,PNIN,Paninvest Tbk.,https://s3.goapi.io/logo/PNIN.jpg,3752,3752,3752,3752,3752,0,0,0,0,0,-
606,NCKL,Trimegah Bangun Persada Tbk.,https://s3.goapi.io/logo/NCKL.jpg,2251,2251,2251,2251,2251,0,0,0,0,0,-
699,PTPW,Pratama Widya Tbk.,https://s3.goapi.io/logo/PTPW.jpg,1014,1014,1014,1014,1014,0,0,0,0,0,-
150,BNLI,Bank Permata Tbk.,https://s3.goapi.io/logo/BNLI.jpg,3362,3362,3362,3362,3362,0,0,0,0,0,-
756,SHID,Hotel Sahid Jaya International Tbk.,https://s3.goapi.io/logo/SHID.jpg,1868,1868,1868,1868,1868,0,0,0,0,0,-
95,BBHI,Allo Bank Indonesia Tbk.,https://s3.goapi.io/logo/BBHI.jpg,4982,4982,4982,4982,4982,0,0,0,0,0,-
534,MCAS,M Cash Integrasi Tbk.,https://s3.goapi.io/logo/MCAS.jpg,1340,1340,1340,1340,1340,0,0,0,0,0,-
702,PTSP,Pioneerindo Gourmet International Tbk.,https://s3.goapi.io/logo/PTSP.jpg,1667,1667,1667,1667,1667,0,0,0,0,0,-
839,TINS,Timah Tbk.,https://s3.goapi.io/logo/TINS.jpg,2314,2314,2314,2314,2314,0,0,0,0,0,-
179,BUKK,Bukaka Teknik Utama Tbk.,https://s3.goapi.io/logo/BUKK.jpg,3253,3253,3253,3253,3253,0,0,0,0,0,-
532,MBSS,Mitrabahtera Segara Sejati Tbk.,https://s3.goapi.io/logo/MBSS.jpg,4982,4982,4982,4982,4982,0,0,0,0,0,-
575,MPMX,Mitra Pinasthika Mustika Tbk.,https://s3.goapi.io/logo/MPMX.jpg,1831,1831,1831,1831,1831,0,0,0,0,0,-
764,SIPD,Sreeya Sewu Indonesia Tbk.,https://s3.goapi.io/logo/SIPD.jpg,4980,4980,4980,4980,4980,0,0,0,0,0,-
281,ENAK,Champ Resto Indonesia Tbk.,https://s3.goapi.io/logo/ENAK.jpg,2142,2142,2142,2142,2142,0,0,0,0,0,-
512,LTLS,Lautan Luas Tbk.,https://s3.goapi.io/logo/LTLS.jpg,1124,1124,1124,1124,1124,0,0,0,0,0,-
132,BJBR,Bank Pembangunan Daerah Jawa Barat dan Banten Tbk.,https://s3.goapi.io/logo/BJBR.jpg,4493,4493,4493,4493,4493,0,0,0,0,0,-
581,MREI,Maskapai Reasuransi Indonesia Tbk.,https://s3.goapi.io/logo/MREI.jpg,2551,2551,2551,2551,2551,0,0,0,0,0,-
732,ROTI,Nippon Indosari Corpindo Tbk.,https://s3.goapi.io/logo/ROTI.jpg,1591,1591,1591,1591,1591,0,0,0,0,0,-
166,BSDE,Bumi Serpong Damai Tbk.,https://s3.goapi.io/logo/BSDE.jpg,3263,3263,3263,3263,3263,0,0,0,0,0,-
197,CBUT,Citra Borneo Utama Tbk.,https://s3.goapi.io/logo/CBUT.jpg,3458,3458,3458,3458,3458,0,0,0,0,0,-
712,RAJA,Rukun Raharja Tbk.,https://s3.goapi.io/logo/RAJA.jpg,3590,3590,3590,3590,3590,0,0,0,0,0,-
164,BRPT,Barito Pacific Tbk.,https://s3.goapi.io/logo/BRPT.jpg,2459,2459,2459,2459,2459,0,0,0,0,0,-
803,SSMS,Sawit Sumbermas Sarana Tbk.,https://s3.goapi.io/logo/SSMS.jpg,4218,4218,4218,4218,4218,0,0,0,0,0,-
45,APIC,Pacific Strategic Financial Tbk.,https://s3.goapi.io/logo/APIC.jpg,2119,2119,2119,2119,2119,0,0,0,0,0,-
210,CLPI,Colorpak Indonesia Tbk.,https://s3.goapi.io/logo/CLPI.jpg,3429,3429,3429,3429,3429,0,0,0,0,0,-
230,CTBN,Citra Tubindo Tbk.,https://s3.goapi.io/logo/CTBN.jpg,4432,4432,4432,4432,4432,0,0,0,0,0,-
802,SSIA,Surya Semesta Internusa Tbk.,https://s3.goapi.io/logo/SSIA.jpg,3509,3509,3509,3509,3509,0,0,0,0,0,-
908,WIIM,Wismilak Inti Makmur Tbk.,https://s3.goapi.io/logo/WIIM.jpg,4614,4614,4614,4614,4614,0,0,0,0,0,-
325,GJTL,Gajah Tunggal Tbk.,https://s3.goapi.io/logo/GJTL.jpg,2070,2070,2070,2070,2070,0,0,0,0,0,-
591,MTMH,Murni Sadar Tbk.,https://s3.goapi.io/logo/MTMH.jpg,2441,2441,2441,2441,2441,0,0,0,0,0,-
763,SINI,Singaraja Putra Tbk.,https://s3.goapi.io/logo/SINI.jpg,2165,2165,2165,2165,2165,0,0,0,0,0,-
612,NICL,PAM Mineral Tbk.,https://s3.goapi.io/logo/NICL.jpg,4464,4464,4464,4464,4464,0,0,0,0,0,-
665,PNBN,Bank Pan Indonesia Tbk,https://s3.goapi.io/logo/PNBN.jpg,1606,1606,1606,1606,1606,0,0,0,0,0,-
874,TUGU,Asuransi Tugu Pratama Indonesia Tbk.,https://s3.goapi.io/logo/TUGU.jpg,1230,1230,1230,1230,1230,0,0,0,0,0,-
370,HRUM,Harum Energy Tbk.,https://s3.goapi.io/logo/HRUM.jpg,4916,4916,4916,4916,4916,0,0,0,0,0,-
568,MLPT,Multipolar Technology Tbk.,https://s3.goapi.io/logo/MLPT.jpg,4472,4472,4472,4472,4472,0,0,0,0,0,-
455,KEJU,Mulia Boga Raya Tbk.,https://s3.goapi.io/logo/KEJU.jpg,1064,1064,1064,1064,1064,0,0,0,0,0,-
183,BVIC,Bank Victoria International Tbk.,https://s3.goapi.io/logo/BVIC.jpg,1747,1747,1747,1747,1747,0,0,0,0,0,-
652,PGEO,Pertamina Geothermal Energy Tbk.,https://s3.goapi.io/logo/PGEO.jpg,4667,4667,4667,4667,4667,0,0,0,0,0,-
388,IMAS,Indomobil Sukses Internasional Tbk.,https://s3.goapi.io/logo/IMAS.jpg,3747,3747,3747,3747,3747,0,0,0,0,0,-
43,ANTM,Aneka Tambang Tbk.,https://s3.goapi.io/logo/ANTM.jpg,4111,4111,4111,4111,4111,0,0,0,0,0,-
104,BBTN,Bank Tabungan Negara (Persero) Tbk.,https://s3.goapi.io/logo/BBTN.jpg,4244,4244,4244,4244,4244,0,0,0,0,0,-
617,NISP,Bank OCBC NISP Tbk.,https://s3.goapi.io/logo/NISP.jpg,1275,1275,1275,1275,1275,0,0,0,0,0,-
93,BAYU,Bayu Buana Tbk,https://s3.goapi.io/logo/BAYU.jpg,1036,1036,1036,1036,1036,0,0,0,0,0,-
542,MEDC,Medco Energi Internasional Tbk.,https://s3.goapi.io/logo/MEDC.jpg,4733,4733,4733,4733,4733,0,0,0,0,0,-
523,MAPI,Mitra Adiperkasa Tbk.,https://s3.goapi.io/logo/MAPI.jpg,1277,1277,1277,1277,1277,0,0,0,0,0,-
801,SRTG,Saratoga Investama Sedaya Tbk.,https://s3.goapi.io/logo/SRTG.jpg,1853,1853,1853,1853,1853,0,0,0,0,0,-
597,MYOH,Samindo Resources Tbk.,https://s3.goapi.io/logo/MYOH.jpg,3849,3849,3849,3849,3849,0,0,0,0,0,-
508,LPPF,Matahari Department Store Tbk.,https://s3.goapi.io/logo/LPPF.jpg,1771,1771,1771,1771,1771,0,0,0,0,0,-
316,GAMA,Aksara Global Development Tbk.,https://s3.goapi.io/logo/GAMA.jpg,3246,3246,3246,3246,3246,0,0,0,0,0,-
176,BUAH,Segar Kumala Indonesia Tbk.,https://s3.goapi.io/logo/BUAH.jpg,3173,3173,3173,3173,3173,0,0,0,0,0,-
667,PNGO,Pinago Utama Tbk.,https://s3.goapi.io/logo/PNGO.jpg,4433,4433,4433,4433,4433,0,0,0,0,0,-
211,CMNP,Citra Marga Nusaphala Persada Tbk.,https://s3.goapi.io/logo/CMNP.jpg,3120,3120,3120,3120,3120,0,0,0,0,0,-
25,AKRA,AKR Corporindo Tbk.,https://s3.goapi.io/logo/AKRA.jpg,1664,1664,1664,1664,1664,0,0,0,0,0,-
268,DVLA,Darya-Varia Laboratoria Tbk.,https://s3.goapi.io/logo/DVLA.jpg,4232,4232,4232,4232,4232,0,0,0,0,0,-
467,KLBF,Kalbe Farma Tbk.,https://s3.goapi.io/logo/KLBF.jpg,2250,2250,2250,2250,2250,0,0,0,0,0,-
452,KDSI,Kedawung Setia Industrial Tbk.,https://s3.goapi.io/logo/KDSI.jpg,2408,2408,2408,2408,2408,0,0,0,0,0,-
318,GDYR,Goodyear Indonesia Tbk.,https://s3.goapi.io/logo/GDYR.jpg,3073,3073,3073,3073,3073,0,0,0,0,0,-
641,PANS,Panin Sekuritas Tbk.,https://s3.goapi.io/logo/PANS.jpg,2620,2620,2620,2620,2620,0,0,0,0,0,-
438,JPFA,Japfa Comfeed Indonesia Tbk.,https://s3.goapi.io/logo/JPFA.jpg,2350,2350,2350,2350,2350,0,0,0,0,0,-
17,AGII,Samator Indo Gas Tbk.,https://s3.goapi.io/logo/AGII.jpg,1174,1174,1174,1174,1174,0,0,0,0,0,-
148,BNGA,Bank CIMB Niaga Tbk.,https://s3.goapi.io/logo/BNGA.jpg,3289,3289,3289,3289,3289,0,0,0,0,0,-
138,BLTZ,Graha Layar Prima Tbk.,https://s3.goapi.io/logo/BLTZ.jpg,4065,4065,4065,4065,4065,0,0,0,0,0,-
753,SFAN,Surya Fajar Capital Tbk.,https://s3.goapi.io/logo/SFAN.jpg,3954,3954,3954,3954,3954,0,0,0,0,0,-
323,GHON,Gihon Telekomunikasi Indonesia Tbk.,https://s3.goapi.io/logo/GHON.jpg,3806,3806,3806,3806,3806,0,0,0,0,0,-
522,MAPB,MAP Boga Adiperkasa Tbk.,https://s3.goapi.io/logo/MAPB.jpg,1649,1649,1649,1649,1649,0,0,0,0,0,-
881,ULTJ,Ultrajaya Milk Industry & Trading Company Tbk.,https://s3.goapi.io/logo/ULTJ.jpg,4371,4371,4371,4371,4371,0,0,0,0,0,-
442,JSPT,Jakarta Setiabudi Internasional Tbk.,https://s3.goapi.io/logo/JSPT.jpg,1525,1525,1525,1525,1525,0,0,0,0,0,-
824,TBIG,Tower Bersama Infrastructure Tbk.,https://s3.goapi.io/logo/TBIG.jpg,2927,2927,2927,2927,2927,0,0,0,0,0,-
206,CITA,Cita Mineral Investindo Tbk.,https://s3.goapi.io/logo/CITA.jpg,1970,1970,1970,1970,1970,0,0,0,0,0,-
98,BBMD,Bank Mestika Dharma Tbk.,https://s3.goapi.io/logo/BBMD.jpg,2943,2943,2943,2943,2943,0,0,0,0,0,-
873,TSPC,Tempo Scan Pacific Tbk.,https://s3.goapi.io/logo/TSPC.jpg,3759,3759,3759,3759,3759,0,0,0,0,0,-
785,SMSM,Selamat Sempurna Tbk.,https://s3.goapi.io/logo/SMSM.jpg,3479,3479,3479,3479,3479,0,0,0,0,0,-
199,CEKA,Wilmar Cahaya Indonesia Tbk.,https://s3.goapi.io/logo/CEKA.jpg,3127,3127,3127,3127,3127,0,0,0,0,0,-
609,NFCX,NFC Indonesia Tbk.,https://s3.goapi.io/logo/NFCX.jpg,1191,1191,1191,1191,1191,0,0,0,0,0,-
798,SRAJ,Sejahteraraya Anugrahjaya Tbk.,https://s3.goapi.io/logo/SRAJ.jpg,2165,2165,2165,2165,2165,0,0,0,0,0,-
174,BTPN,Bank BTPN Tbk.,https://s3.goapi.io/logo/BTPN.jpg,4350,4350,4350,4350,4350,0,0,0,0,0,-
538,MDKA,Merdeka Copper Gold Tbk.,https://s3.goapi.io/logo/MDKA.jpg,3474,3474,3474,3474,3474,0,0,0,0,0,-
161,BRIS,Bank Syariah Indonesia Tbk.,https://s3.goapi.io/logo/BRIS.jpg,3321,3321,3321,3321,3321,0,0,0,0,0,-
888,UNVR,Unilever Indonesia Tbk.,https://s3.goapi.io/logo/UNVR.jpg,2296,2296,2296,2296,2296,0,0,0,0,0,-
924,YULE,Yulie Sekuritas Indonesia Tbk.,https://s3.goapi.io/logo/YULE.jpg,3251,3251,3251,3251,3251,0,0,0,0,0,-
286,EPMT,Enseval Putera Megatrading Tbk.,https://s3.goapi.io/logo/EPMT.jpg,1790,1790,1790,1790,1790,0,0,0,0,0,-
110,BDMN,Bank Danamon Indonesia Tbk.,https://s3.goapi.io/logo/BDMN.jpg,3361,3361,3361,3361,3361,0,0,0,0,0,-
662,PLIN,Plaza Indonesia Realty Tbk.,https://s3.goapi.io/logo/PLIN.jpg,3191,3191,3191,3191,3191,0,0,0,0,0,-
598,MYOR,Mayora Indah Tbk.,https://s3.goapi.io/logo/MYOR.jpg,1405,1405,1405,1405,1405,0,0,0,0,0,-
322,GGRP,Gunung Raja Paksi Tbk.,https://s3.goapi.io/logo/GGRP.jpg,4963,4963,4963,4963,4963,0,0,0,0,0,-
693,PTBA,Bukit Asam Tbk.,https://s3.goapi.io/logo/PTBA.jpg,2789,2789,2789,2789,2789,0,0,0,0,0,-
57,ARTA,Arthavest Tbk,https://s3.goapi.io/logo/ARTA.jpg,2205,2205,2205,2205,2205,0,0,0,0,0,-
583,MSIN,MNC Digital Entertainment Tbk.,https://s3.goapi.io/logo/MSIN.jpg,3661,3661,3661,3661,3661,0,0,0,0,0,-
228,CSMI,Cipta Selera Murni Tbk.,https://s3.goapi.io/logo/CSMI.jpg,1349,1349,1349,1349,1349,0,0,0,0,0,-
40,AMRT,Sumber Alfaria Trijaya Tbk.,https://s3.goapi.io/logo/AMRT.jpg,1645,1645,1645,1645,1645,0,0,0,0,0,-
686,PRDA,Prodia Widyahusada Tbk.,https://s3.goapi.io/logo/PRDA.jpg,1195,1195,1195,1195,1195,0,0,0,0,0,-
170,BSWD,Bank Of India Indonesia Tbk.,https://s3.goapi.io/logo/BSWD.jpg,4814,4814,4814,4814,4814,0,0,0,0,0,-
557,MIKA,Mitra Keluarga Karyasehat Tbk.,https://s3.goapi.io/logo/MIKA.jpg,4551,4551,4551,4551,4551,0,0,0,0,0,-
752,SEMA,Semacom Integrated Tbk.,https://s3.goapi.io/logo/SEMA.jpg,2829,2829,2829,2829,2829,0,0,0,0,0,-
845,TLKM,Telkom Indonesia (Persero) Tbk.,https://s3.goapi.io/logo/TLKM.jpg,3849,3849,3849,3849,3849,0,0,0,0,0,-
530,MBAP,Mitrabara Adiperdana Tbk.,https://s3.goapi.io/logo/MBAP.jpg,4202,4202,4202,4202,4202,0,0,0,0,0,-
14,ADRO,Adaro Energy Indonesia Tbk.,https://s3.goapi.io/logo/ADRO.jpg,3282,3282,3282,3282,3282,0,0,0,0,0,-
527,MASB,Bank Multiarta Sentosa Tbk.,https://s3.goapi.io/logo/MASB.jpg,4034,4034,4034,4034,4034,0,0,0,0,0,-
504,LPGI,Lippo General Insurance Tbk.,https://s3.goapi.io/logo/LPGI.jpg,3011,3011,3011,3011,3011,0,0,0,0,0,-
4,ABMM,ABM Investama Tbk.,https://s3.goapi.io/logo/ABMM.jpg,2029,2029,2029,2029,2029,0,0,0,0,0,-
572,MOLI,Madusari Murni Indah Tbk.,https://s3.goapi.io/logo/MOLI.jpg,1088,1088,1088,1088,1088,0,0,0,0,0,-
547,MERK,Merck Tbk.,https://s3.goapi.io/logo/MERK.jpg,4839,4839,4839,4839,4839,0,0,0,0,0,-
776,SMGR,Semen Indonesia (Persero) Tbk.,https://s3.goapi.io/logo/SMGR.jpg,4951,4951,4951,4951,4951,0,0,0,0,0,-
300,FILM,MD Pictures Tbk.,https://s3.goapi.io/logo/FILM.jpg,2435,2435,2435,2435,2435,0,0,0,0,0,-
267,DUTI,Duta Pertiwi Tbk,https://s3.goapi.io/logo/DUTI.jpg,2850,2850,2850,2850,2850,0,0,0,0,0,-
169,BSSR,Baramulti Suksessarana Tbk.,https://s3.goapi.io/logo/BSSR.jpg,3487,3487,3487,3487,3487,0,0,0,0,0,-
126,BINA,Bank Ina Perdana Tbk.,https://s3.goapi.io/logo/BINA.jpg,4769,4769,4769,4769,4769,0,0,0,0,0,-
329,GMTD,Gowa Makassar Tourism Development Tbk.,https://s3.goapi.io/logo/GMTD.jpg,3976,3976,3976,3976,3976,0,0,0,0,0,-
35,AMFG,Asahimas Flat Glass Tbk.,https://s3.goapi.io/logo/AMFG.jpg,3324,3324,3324,3324,3324,0,0,0,0,0,-
100,BBRI,Bank Rakyat Indonesia (Persero) Tbk.,https://s3.goapi.io/logo/BBRI.jpg,3175,3175,3175,3175,3175,0,0,0,0,0,-
257,DNET,Indoritel Makmur Internasional Tbk.,https://s3.goapi.io/logo/DNET.jpg,1552,1552,1552,1552,1552,0,0,0,0,0,-
3,ABDA,Asuransi Bina Dana Arta Tbk.,https://s3.goapi.io/logo/ABDA.jpg,1960,1960,1960,1960,1960,0,0,0,0,0,-
99,BBNI,Bank Negara Indonesia (Persero) Tbk.,https://s3.goapi.io/logo/BBNI.jpg,4437,4437,4437,4437,4437,0,0,0,0,0,-
214,CMRY,Cisarua Mountain Dairy Tbk.,https://s3.goapi.io/logo/CMRY.jpg,2972,2972,2972,2972,2972,0,0,0,0,0,-
221,CPIN,Charoen Pokphand Indonesia Tbk,https://s3.goapi.io/logo/CPIN.jpg,3346,3346,3346,3346,3346,0,0,0,0,0,-
297,FAPA,FAP Agri Tbk.,https://s3.goapi.io/logo/FAPA.jpg,3020,3020,3020,3020,3020,0,0,0,0,0,-
639,PANI,Pantai Indah Kapuk Dua Tbk.,https://s3.goapi.io/logo/PANI.jpg,4576,4576,4576,4576,4576,0,0,0,0,0,-
441,JSMR,Jasa Marga (Persero) Tbk.,https://s3.goapi.io/logo/JSMR.jpg,1995,1995,1995,1995,1995,0,0,0,0,0,-
535,MCOL,Prima Andalan Mandiri Tbk.,https://s3.goapi.io/logo/MCOL.jpg,4678,4678,4678,4678,4678,0,0,0,0,0,-
299,FASW,Fajar Surya Wisesa Tbk.,https://s3.goapi.io/logo/FASW.jpg,4284,4284,4284,4284,4284,0,0,0,0,0,-
159,BRAM,Indo Kordsa Tbk.,https://s3.goapi.io/logo/BRAM.jpg,4849,4849,4849,4849,4849,0,0,0,0,0,-
1,AALI,Astra Agro Lestari Tbk.,https://s3.goapi.io/logo/AALI.jpg,1047,1047,1047,1047,1047,0,0,0,0,0,-
526,MASA,Multistrada Arah Sarana Tbk.,https://s3.goapi.io/logo/MASA.jpg,3098,3098,3098,3098,3098,0,0,0,0,0,-
565,MLBI,Multi Bintang Indonesia Tbk.,https://s3.goapi.io/logo/MLBI.jpg,1734,1734,1734,1734,1734,0,0,0,0,0,-
835,TGKA,Tigaraksa Satria Tbk.,https://s3.goapi.io/logo/TGKA.jpg,4072,4072,4072,4072,4072,0,0,0,0,0,-
143,BMRI,Bank Mandiri (Persero) Tbk.,https://s3.goapi.io/logo/BMRI.jpg,3650,3650,3650,3650,3650,0,0,0,0,0,-
358,HEXA,Hexindo Adiperkasa Tbk.,https://s3.goapi.io/logo/HEXA.jpg,4095,4095,4095,4095,4095,0,0,0,0,0,-
180,BULL,Buana Lintas Lautan Tbk.,https://s3.goapi.io/logo/BULL.jpg,4588,4588,4588,4588,4588,0,0,0,0,0,-
411,INTP,Indocement Tunggal Prakarsa Tbk.,https://s3.goapi.io/logo/INTP.jpg,2215,2215,2215,2215,2215,0,0,0,0,0,-
201,CFIN,Clipan Finance Indonesia Tbk.,https://s3.goapi.io/logo/CFIN.jpg,2257,2257,2257,2257,2257,0,0,0,0,0,-
828,TCPI,Transcoal Pacific Tbk.,https://s3.goapi.io/logo/TCPI.jpg,1743,1743,1743,1743,1743,0,0,0,0,0,-
843,TKIM,Pabrik Kertas Tjiwi Kimia Tbk.,https://s3.goapi.io/logo/TKIM.jpg,4931,4931,4931,4931,4931,0,0,0,0,0,-
403,INKP,Indah Kiat Pulp & Paper Tbk.,https://s3.goapi.io/logo/INKP.jpg,1073,1073,1073,1073,1073,0,0,0,0,0,-
700,PTRO,Petrosea Tbk.,https://s3.goapi.io/logo/PTRO.jpg,1399,1399,1399,1399,1399,0,0,0,0,0,-
160,BREN,Barito Renewables Energy Tbk.,https://s3.goapi.io/logo/BREN.jpg,3561,3561,3561,3561,3561,0,0,0,0,0,-
9,ADES,Akasha Wira International Tbk.,https://s3.goapi.io/logo/ADES.jpg,4425,4425,4425,4425,4425,0,0,0,0,0,-
377,ICBP,Indofood CBP Sukses Makmur Tbk.,https://s3.goapi.io/logo/ICBP.jpg,1134,1134,1134,1134,1134,0,0,0,0,0,-
422,ISAT,Indosat Tbk.,https://s3.goapi.io/logo/ISAT.jpg,1611,1611,1611,1611,1611,0,0,0,0,0,-
11,ADMF,Adira Dinamika Multi Finance Tbk.,https://s3.goapi.io/logo/ADMF.jpg,4325,4325,4325,4325,4325,0,0,0,0,0,-
808,STTP,Siantar Top Tbk.,https://s3.goapi.io/logo/STTP.jpg,4510,4510,4510,4510,4510,0,0,0,0,0,-
717,RDTX,Roda Vivatex Tbk,https://s3.goapi.io/logo/RDTX.jpg,4947,4947,4947,4947,4947,0,0,0,0,0,-
781,SMMA,Sinarmas Multiartha Tbk.,https://s3.goapi.io/logo/SMMA.jpg,2219,2219,2219,2219,2219,0,0,0,0,0,-
321,GGRM,Gudang Garam Tbk.,https://s3.goapi.io/logo/GGRM.jpg,4958,4958,4958,4958,4958,0,0,0,0,0,-
185,BYAN,Bayan Resources Tbk.,https://s3.goapi.io/logo/BYAN.jpg,3342,3342,3342,3342,3342,0,0,0,0,0,-
887,UNTR,United Tractors Tbk.,https://s3.goapi.io/logo/UNTR.jpg,1697,1697,1697,1697,1697,0,0,0,0,0,-
426,ITMG,Indo Tambangraya Megah Tbk.,https://s3.goapi.io/logo/ITMG.jpg,1408,1408,1408,1408,1408,0,0,0,0,0,-
563,MKPI,Metropolitan Kentjana Tbk.,https://s3.goapi.io/logo/MKPI.jpg,3109,3109,3109,3109,3109,0,0,0,0,0,-
265,DSSA,Dian Swastatika Sentosa Tbk,https://s3.goapi.io/logo/DSSA.jpg,3621,3621,3621,3621,3621,0,0,0,0,0,-
239,DCII,DCI Indonesia Tbk.,https://s3.goapi.io/logo/DCII.jpg,1310,1310,1310,1310,1310,0,0,0,0,0,-
315,FWCT,Wijaya Cahaya Timber Tbk.,https://s3.goapi.io/logo/FWCT.jpg,2462,2462,2462,2462,2462,0,0,0,0,0,-
402,INET,Sinergi Inti Andalan Prima Tbk.,https://s3.goapi.io/logo/INET.jpg,3685,3685,3685,3685,3685,0,0,0,0,0,-
656,PICO,Pelangi Indah Canindo Tbk,https://s3.goapi.io/logo/PICO.jpg,4459,4459,4459,4459,4459,0,0,0,0,0,-
675,POLY,Asia Pacific Fibers Tbk,https://s3.goapi.io/logo/POLY.jpg,1042,1042,1042,1042,1042,0,0,0,0,0,-
726,RMBA,Bentoel Internasional Investama Tbk.,https://s3.goapi.io/logo/RMBA.jpg,3673,3673,3673,3673,3673,0,0,0,0,0,-
842,TKGA,Permata Prima Sakti Tbk.,https://s3.goapi.io/logo/TKGA.jpg,2325,2325,2325,2325,2325,0,0,0,0,0,-
847,TMPI,PT Sigmagold Inti Perkasa Tbk.,https://s3.goapi.io/logo/TMPI.jpg,3660,3660,3660,3660,3660,0,0,0,0,0,-
870,TRUE,Triniti Dinamik Tbk.,https://s3.goapi.io/logo/TRUE.jpg,3395,3395,3395,3395,3395,0,0,0,0,0,-
875,TURI,Tunas Ridean Tbk.,https://s3.goapi.io/logo/TURI.jpg,4133,4133,4133,4133,4133,0,0,0,0,0,-
883,UNIQ,Ulima Nitra Tbk.,https://s3.goapi.io/logo/UNIQ.jpg,2721,2721,2721,2721,2721,0,0,0,0,0,-
""";
