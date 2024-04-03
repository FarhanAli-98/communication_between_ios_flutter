class VideoViewModel {
  final String url;
  final String thumbnail;

  VideoViewModel({required this.url, required this.thumbnail});
}

 List<VideoViewModel> addDataToVideoView() {
  List<VideoViewModel> getVideoView = [];
  for (var data in jsonData) {
    getVideoView.add(VideoViewModel(url: data['link']!, thumbnail: data['thumb']!));
  }
  return getVideoView;
}

List<Map<String, String>> jsonData = [
  {
    "link": "https://stream.mux.com/EeHebcbvEDQcaKJMHwkk1Hr7Ortxelxb8mKD6kIttWE.m3u8",
    "thumb": "https://image.mux.com/EeHebcbvEDQcaKJMHwkk1Hr7Ortxelxb8mKD6kIttWE/thumbnail.png?width=200&height=400&time=0"
  },
  {
    "link": "https://stream.mux.com/jxyz9htVPaZ4xcaRn4mh02jXK6t3lerfGxl96g00EqVvU.m3u8",
    "thumb": "https://image.mux.com/jxyz9htVPaZ4xcaRn4mh02jXK6t3lerfGxl96g00EqVvU/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/rk401kAj6WMOjYbOXZNTaBV77QaKYc7TB75JzcOMZNgA.m3u8",
    "thumb": "https://image.mux.com/rk401kAj6WMOjYbOXZNTaBV77QaKYc7TB75JzcOMZNgA/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/JYb1YKSHa2r3ExqzanDw1G00Nt602whK0100hb01g3jlg2o00.m3u8",
    "thumb": "https://image.mux.com/JYb1YKSHa2r3ExqzanDw1G00Nt602whK0100hb01g3jlg2o00/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/Adepn6ALCKfds4Cel6w3WPPUx8KWoEyrPW00ZwbjNjNY.m3u8",
    "thumb": "https://image.mux.com/Adepn6ALCKfds4Cel6w3WPPUx8KWoEyrPW00ZwbjNjNY/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/EeHebcbvEDQcaKJMHwkk1Hr7Ortxelxb8mKD6kIttWE.m3u8",
    "thumb": "https://image.mux.com/EeHebcbvEDQcaKJMHwkk1Hr7Ortxelxb8mKD6kIttWE/thumbnail.png?width=200&height=400&time=0"
  },
  {
    "link": "https://stream.mux.com/YiKwQgZdV021QD4cGtStZbnZ4Xd1DhXqeFHTSi7xEpsI.m3u8",
    "thumb": "https://image.mux.com/YiKwQgZdV021QD4cGtStZbnZ4Xd1DhXqeFHTSi7xEpsI/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/g8Rort7S6jHhwGHQzIo3UYqwV5szgNwb02p8QzFhs3MA.m3u8",
    "thumb": "https://image.mux.com/g8Rort7S6jHhwGHQzIo3UYqwV5szgNwb02p8QzFhs3MA/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/8CPJMhNaWqakavuapJxet2O8ppONYeTkW2Uznc5NukA.m3u8",
    "thumb": "https://image.mux.com/02JnG01Sr3VmVD7Gl9P01dPRo01mCQwOIFCRnVVDPDjta500/thumbnail.png?width=200&height=400&time=0"
  },
  {
    "link": "https://stream.mux.com/vXxfsXLimhtFM6B3Qv02400yxSoETzHQugiIBMWe38nys.m3u8",
    "thumb": "https://image.mux.com/vXxfsXLimhtFM6B3Qv02400yxSoETzHQugiIBMWe38nys/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/TQ5vMp01eRxURJHU7uquWswIj41JMsjek54KALwY9vs4.m3u8",
    "thumb": "https://image.mux.com/TQ5vMp01eRxURJHU7uquWswIj41JMsjek54KALwY9vs4/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/vDW7nsBwOlg5ogyk00VAGheRHpSyxYmyCFH601XLYp8Mk.m3u8",
    "thumb": "https://image.mux.com/vDW7nsBwOlg5ogyk00VAGheRHpSyxYmyCFH601XLYp8Mk/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/nYAq1vJlU6NHvqs8ZL6x9PoB902Q2wDUpzEP4CP5ldf00.m3u8",
    "thumb": "https://image.mux.com/nYAq1vJlU6NHvqs8ZL6x9PoB902Q2wDUpzEP4CP5ldf00/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/EjHg7tH5t02OBSA1k601UZZjn9uT41JjtNttybpLYbNRU.m3u8",
    "thumb": "https://image.mux.com/EjHg7tH5t02OBSA1k601UZZjn9uT41JjtNttybpLYbNRU/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/dPLJOWnUm501400xLmYTP6v7YaWciu19Thp3Inme5iZVA.m3u8",
    "thumb": "https://image.mux.com/02JnG01Sr3VmVD7Gl9P01dPRo01mCQwOIFCRnVVDPDjta500/thumbnail.png?width=200&height=400&time=0"
  },
  {
    "link": "https://stream.mux.com/eN9VDlvptGo4y8Gl6qeOJ8oMptKWNOAtW00xVyO01TkNU.m3u8",
    "thumb": "https://image.mux.com/eN9VDlvptGo4y8Gl6qeOJ8oMptKWNOAtW00xVyO01TkNU/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/l3Os5bzWD6lc6u2p6ZtLFlMAwi9y5iFWCq1d01201D5Yg.m3u8",
    "thumb": "https://image.mux.com/l3Os5bzWD6lc6u2p6ZtLFlMAwi9y5iFWCq1d01201D5Yg/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/DOykGyQUM01hM02l9bOA7d01LzxtvuiScN01W6swEOqTU00k.m3u8",
    "thumb": "https://image.mux.com/DOykGyQUM01hM02l9bOA7d01LzxtvuiScN01W6swEOqTU00k/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/6lYkSRnY3WnOcPyr8Uf6EvbHilnLqIUVJm00ZWN029aRU.m3u8",
    "thumb": "https://image.mux.com/6lYkSRnY3WnOcPyr8Uf6EvbHilnLqIUVJm00ZWN029aRU/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/4800Q4Yd8TzuzrNyXSBH5b01RBVp482gRoKRYe5ejemME.m3u8",
    "thumb": "https://image.mux.com/4800Q4Yd8TzuzrNyXSBH5b01RBVp482gRoKRYe5ejemME/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/FPmQQ2QljFh00DKIifAElNb1cFS37k801QHu8DdS41Efs.m3u8",
    "thumb": "https://image.mux.com/02JnG01Sr3VmVD7Gl9P01dPRo01mCQwOIFCRnVVDPDjta500/thumbnail.png?width=200&height=400&time=0"
  },
  {
    "link": "https://stream.mux.com/oQx01cslHQdmlZHw7QIIK4chk7XR8QZhjDp71z9Zj02DQ.m3u8",
    "thumb": "https://image.mux.com/oQx01cslHQdmlZHw7QIIK4chk7XR8QZhjDp71z9Zj02DQ/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/vOcHqRUfStZ8ZM9h2q3fKxOhVUMn1G78zri59Y6r4F8.m3u8",
    "thumb": "https://image.mux.com/vOcHqRUfStZ8ZM9h2q3fKxOhVUMn1G78zri59Y6r4F8/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/3QxmpWNpWGinEQaVbnl2Y4F1Cn7UkNu00lBpWEw3qK01E.m3u8",
    "thumb": "https://image.mux.com/3QxmpWNpWGinEQaVbnl2Y4F1Cn7UkNu00lBpWEw3qK01E/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/Jw9bCIl300vb8VC14BCDpk41hrjm9KjseGJ1bOUoNL6Y.m3u8",
    "thumb": "https://image.mux.com/Jw9bCIl300vb8VC14BCDpk41hrjm9KjseGJ1bOUoNL6Y/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/o02v5HL7fmT6CexvDAiPm6e3RERsFzgE6rYxmrYr02alA.m3u8",
    "thumb": "https://image.mux.com/o02v5HL7fmT6CexvDAiPm6e3RERsFzgE6rYxmrYr02alA/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/02JnG01Sr3VmVD7Gl9P01dPRo01mCQwOIFCRnVVDPDjta500.m3u8",
    "thumb": "https://image.mux.com/02JnG01Sr3VmVD7Gl9P01dPRo01mCQwOIFCRnVVDPDjta500/thumbnail.png?width=200&height=400&time=0"
  },
  {
    "link": "https://stream.mux.com/LSPdDFHbPUgWYZshUAK7NvDX7JR4250101QxJ8bE8fZt8.m3u8",
    "thumb": "https://image.mux.com/LSPdDFHbPUgWYZshUAK7NvDX7JR4250101QxJ8bE8fZt8/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/k8g2pz2ajhr7hX19LDCrer3KeOu9dS01jVI65c7jFXhQ.m3u8",
    "thumb": "https://image.mux.com/k8g2pz2ajhr7hX19LDCrer3KeOu9dS01jVI65c7jFXhQ/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/tZZEq1TIeT02qs669lxcluLHL1mczihIISdeA8ChLrko.m3u8",
    "thumb": "https://image.mux.com/tZZEq1TIeT02qs669lxcluLHL1mczihIISdeA8ChLrko/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/8wS7YJwC2O7tvNNP2UMcEe00Oej3FeNBeA1p97YZs3TA.m3u8",
    "thumb": "https://image.mux.com/8wS7YJwC2O7tvNNP2UMcEe00Oej3FeNBeA1p97YZs3TA/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/BXCas2kzXugyydIyax2VcBTtavSzwZ01MD2t8Pe9pD01g.m3u8",
    "thumb": "https://image.mux.com/BXCas2kzXugyydIyax2VcBTtavSzwZ01MD2t8Pe9pD01g/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/RVVXEFHplufZ4GlOYx014dDeyh6csNCTtZ7G4ZXb02RYQ.m3u8",
    "thumb": "https://image.mux.com/02JnG01Sr3VmVD7Gl9P01dPRo01mCQwOIFCRnVVDPDjta500/thumbnail.png?width=200&height=400&time=0"
  },
  {
    "link": "https://stream.mux.com/Gxln3iabar00xr6Q6bHEnOO5IP01qu9KyFW5PqsDrghIA.m3u8",
    "thumb": "https://image.mux.com/Gxln3iabar00xr6Q6bHEnOO5IP01qu9KyFW5PqsDrghIA/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/fxKd701NFWXCpFvbl00KZ78YMT1khC8VYYqjc639oZYkc.m3u8",
    "thumb": "https://image.mux.com/fxKd701NFWXCpFvbl00KZ78YMT1khC8VYYqjc639oZYkc/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/PIUAuhiKegAVFUlbWDWYHSYYeJV3ZgGMCe7aainuO2I.m3u8",
    "thumb": "https://image.mux.com/PIUAuhiKegAVFUlbWDWYHSYYeJV3ZgGMCe7aainuO2I/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/nSXhxPceCkXMxS2Chugu01Kxo00iBuf7piV02KbUfrVm00w.m3u8",
    "thumb": "https://image.mux.com/nSXhxPceCkXMxS2Chugu01Kxo00iBuf7piV02KbUfrVm00w/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/ddjvwo5qedLxhTjKiaAiS00c3JZ8f4Q15q563wNT4qGY.m3u8",
    "thumb": "https://image.mux.com/ddjvwo5qedLxhTjKiaAiS00c3JZ8f4Q15q563wNT4qGY/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/8CPJMhNaWqakavuapJxet2O8ppONYeTkW2Uznc5NukA.m3u8",
    "thumb": "https://image.mux.com/02JnG01Sr3VmVD7Gl9P01dPRo01mCQwOIFCRnVVDPDjta500/thumbnail.png?width=200&height=400&time=0"
  },
  {
    "link": "https://stream.mux.com/02WUtVgt1mcjxv02iMWrrU4loEOV01IFBj00wcr00JNkWpjE.m3u8",
    "thumb": "https://image.mux.com/02WUtVgt1mcjxv02iMWrrU4loEOV01IFBj00wcr00JNkWpjE/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/oKDHkWy5vbYtdSFgKvUO1tkfIglL9HfiRXxi00C6M5HE.m3u8",
    "thumb": "https://image.mux.com/oKDHkWy5vbYtdSFgKvUO1tkfIglL9HfiRXxi00C6M5HE/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/d6aPDye5Px77FThoqCbPnDwXsNd3SRjAq7DuePusaxI.m3u8",
    "thumb": "https://image.mux.com/d6aPDye5Px77FThoqCbPnDwXsNd3SRjAq7DuePusaxI/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/wuFzi00701ez02GTJFUjxKMZ89v00qFei01gi8MNGC2YlGNg.m3u8",
    "thumb": "https://image.mux.com/wuFzi00701ez02GTJFUjxKMZ89v00qFei01gi8MNGC2YlGNg/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/dPLJOWnUm501400xLmYTP6v7YaWciu19Thp3Inme5iZVA.m3u8",
    "thumb": "https://image.mux.com/02JnG01Sr3VmVD7Gl9P01dPRo01mCQwOIFCRnVVDPDjta500/thumbnail.png?width=200&height=400&time=0"
  },
  {
    "link": "https://stream.mux.com/Qzt64d6SUzTc3Nl9hVb007JCnMwOQvYiQdfR01nyO4sms.m3u8",
    "thumb": "https://image.mux.com/Qzt64d6SUzTc3Nl9hVb007JCnMwOQvYiQdfR01nyO4sms/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/Yi598voADsSlQfHDfomxEH2lIsjamifK02JUB4ZIfy4s.m3u8",
    "thumb": "https://image.mux.com/Yi598voADsSlQfHDfomxEH2lIsjamifK02JUB4ZIfy4s/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/tzJG4V202CLz8aepdHptGkaNedhnnMFzxBxoUpQNgAbQ.m3u8",
    "thumb": "https://image.mux.com/tzJG4V202CLz8aepdHptGkaNedhnnMFzxBxoUpQNgAbQ/thumbnail.png?width=100&height=200&time=0"
  },
  {
    "link": "https://stream.mux.com/Nnen5EFIwpoPcSKkFe2OdLSpV1lgXdSM01Y3O7s3F402s.m3u8",
    "thumb": "https://image.mux.com/Nnen5EFIwpoPcSKkFe2OdLSpV1lgXdSM01Y3O7s3F402s/thumbnail.png?width=100&height=200&time=0"
  }
];
