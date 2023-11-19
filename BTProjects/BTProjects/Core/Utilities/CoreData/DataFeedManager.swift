//
//  DataFeedManager.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 08/11/23.
//

import Foundation

struct DataFeedManager {
    func bulkCreateCategory() -> [Category] {
        if let url = Bundle.main.url(forResource: "CategoryData", withExtension: "json") {
            let data = try? Data(contentsOf: url)
            return data?.toCategory() ?? []
        }
        return []
    }
    func bulkCreateBook() -> [Book] {
        if let url = Bundle.main.url(forResource: "BookData", withExtension: "json") {
            let data = try? Data(contentsOf: url)
            return data?.toBooks() ?? []
        }
        return []
    }
    
    func createAllData(){
        // MARK: Create category
        let categoryRumah = PersistenceController.shared.create(Category.self)
        categoryRumah?.name = "Rumah"
        
        let categoryLingkungan = PersistenceController.shared.create(Category.self)
        categoryLingkungan?.name = "Lingkungan"
        
        let categorySekolah = PersistenceController.shared.create(Category.self)
        categorySekolah?.name = "Sekolah"
        
        let categoryZoo = PersistenceController.shared.create(Category.self)
        categoryZoo?.name = "Zoo"
        
        // MARK: Create word
        let wordBahaya = PersistenceController.shared.create(Word.self)
        wordBahaya?.name = "bahaya"
        wordBahaya?.signLanguage = "sl_word_bahaya"
        
        let wordTolong = PersistenceController.shared.create(Word.self)
        wordTolong?.name = "tolong"
        wordTolong?.signLanguage = "sl_word_tolong"
        
        // MARK: Create Book1 Sarah dan Bahaya Tersembunyi
        let book1 = PersistenceController.shared.create(Book.self)
        book1?.name = "Sarah dan Bahaya Tersembunyi"
        book1?.summarySignLanguage = "sl_b1"
        book1?.word = wordBahaya
        book1?.categories = [categoryRumah! as Category, categoryLingkungan! as Category]
        
        // MARK: Create StoryPage Sarah dan Bahaya Tersembunyi
        let book1StoryPage1 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage1?.name = "Di pagi yang cerah, Sarah sedang sarapan bersama ibu"
        book1StoryPage1?.order = 1
        book1StoryPage1?.signLanguage = "sl_b1_sp1"
//        book1StoryPage1?.illustration = "il_b1_sp1"
        book1StoryPage1?.desc = ""
        book1StoryPage1?.book = book1
        
        let book1StoryPage2 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage2?.name = "Tidak sengaja, Sarah menumpahkan air dalam gelas. “Byur”"
        book1StoryPage2?.order = 2
        book1StoryPage2?.signLanguage = "sl_b1_sp2"
//        book1StoryPage2?.illustration = "il_b1_sp2"
        book1StoryPage2?.desc = ""
        book1StoryPage2?.book = book1
        
        let book1StoryPage3 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage3?.name = "Ibu berkata “Airnya tumpah ya, yuk kita bersihkan bersama, bahaya tergelincir”"
        book1StoryPage3?.order = 3
        book1StoryPage3?.signLanguage = "sl_b1_sp3"
//        book1StoryPage3?.illustration = "il_b1_sp3"
        book1StoryPage3?.desc = ""
        book1StoryPage3?.book = book1
        
        let book1StoryPage4 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage4?.name = "Air yang tumpah di lantai harus segera dibersihkan karena dapat menyebabkan Sarah dan Ibu tergelincir"
        book1StoryPage4?.order = 4
        book1StoryPage4?.signLanguage = "sl_b1_sp4"
//        book1StoryPage4?.illustration = "il_b1_sp4"
        book1StoryPage4?.desc = ""
        book1StoryPage4?.book = book1
        
        let book1StoryPage5 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage5?.name = "Di jalan menuju sekolah, mereka melihat lampu lalu lintas berwarna merah"
        book1StoryPage5?.order = 5
        book1StoryPage5?.signLanguage = "sl_b1_sp5"
//        book1StoryPage5?.illustration = "il_b1_sp5"
        book1StoryPage5?.desc = ""
        book1StoryPage5?.book = book1
        
        let book1StoryPage6 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage6?.name = "“Merah berarti berhenti, kita menunggu ya” kata Ibu"
        book1StoryPage6?.order = 6
        book1StoryPage6?.signLanguage = "sl_b1_sp6"
//        book1StoryPage6?.illustration = "il_b1_sp6"
        book1StoryPage6?.desc = ""
        book1StoryPage6?.book = book1
        
        let book1StoryPage7 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage7?.name = "Ketika lampu berubah menjadi hijau, mereka berjalan dengan aman ke sekolah"
        book1StoryPage7?.order = 7
        book1StoryPage7?.signLanguage = "sl_b1_sp7"
//        book1StoryPage7?.illustration = "il_b1_sp7"
        book1StoryPage7?.desc = ""
        book1StoryPage7?.book = book1
        
        let book1StoryPage8 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage8?.name = "Sesampainya di sekolah, Sarah melihat ada gunting di atas meja"
        book1StoryPage8?.order = 8
        book1StoryPage8?.signLanguage = "sl_b1_sp8"
//        book1StoryPage8?.illustration = "il_b1_sp8"
        book1StoryPage8?.desc = ""
        book1StoryPage8?.book = book1
        
        let book1StoryPage9 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage9?.name = "“Sarah tidak bermain dengan gunting di sekolah ya, itu berbahaya dan bisa menyakiti kita” kata Ibu guru"
        book1StoryPage9?.order = 9
        book1StoryPage9?.signLanguage = "sl_b1_sp9"
//        book1StoryPage9?.illustration = "il_b1_sp9"
        book1StoryPage9?.desc = ""
        book1StoryPage9?.book = book1
        
        let book1StoryPage10 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage10?.name = "Sarah mengangguk tanda mengerti untuk berhati-hati dengan gunting"
        book1StoryPage10?.order = 10
        book1StoryPage10?.signLanguage = "sl_b1_sp10"
//        book1StoryPage10?.illustration = "il_b1_sp10"
        book1StoryPage10?.desc = ""
        book1StoryPage10?.book = book1
        
        // MARK: Create Questions Sarah dan Bahaya Tersembunyi
        let book1Question1 = PersistenceController.shared.create(Question.self)
        book1Question1?.name = "Hubungkan gambar di bawah ini yang sesuai"
        book1Question1?.type = 0
        book1Question1?.order = 1
        book1Question1?.signLanguage = "sl_b1_q1"
//        book1Question1?.illustration = "il_b1_q1"
        book1Question1?.isDone = false
        book1Question1?.book = book1
        
        let book1Question2 = PersistenceController.shared.create(Question.self)
        book1Question2?.name = "Pilih gambar yang termasuk kegiatan bahaya"
        book1Question2?.type = 1
        book1Question2?.order = 1
        book1Question2?.signLanguage = "sl_b1_q2"
//        book1Question2?.illustration = "il_b1_q2"
        book1Question2?.isDone = false
        book1Question2?.book = book1
        
        // MARK: Create Answer Sarah dan Bahaya Tersembunyi
        let book1Question2Answer1 = PersistenceController.shared.create(Answer.self)
        book1Question2Answer1?.name = "Menyeberang jalan saat lampu merah"
        book1Question2Answer1?.type = 1
//        book1Question2Answer1?.signLanguage = "sl_b1_q2_a1"
//        book1Question2Answer1?.illustration = "il_b1_q2_a1"
        book1Question2Answer1?.isCorrect = true
        book1Question2Answer1?.question = book1Question2
        
        let book1Question1Answer2 = PersistenceController.shared.create(Answer.self)
        book1Question1Answer2?.name = "Bermain dengan mainan"
        book1Question1Answer2?.type = 1
//        book1Question1Answer2?.signLanguage = "sl_b1_q2_a2"
//        book1Question1Answer2?.illustration = "il_b1_q2_a2"
        book1Question1Answer2?.isCorrect = false
        book1Question1Answer2?.question = book1Question2
        
        let book1Question1Answer3 = PersistenceController.shared.create(Answer.self)
        book1Question1Answer3?.name = "Membersihkan air"
        book1Question1Answer3?.type = 1
//        book1Question1Answer3?.signLanguage = "sl_b1_q2_a3"
//        book1Question1Answer3?.illustration = "il_b1_q2_a3"
        book1Question1Answer3?.isCorrect = false
        book1Question1Answer3?.question = book1Question2
        
        // MARK: Create Book2 Bu, tolong sarah
        let book2 = PersistenceController.shared.create(Book.self)
        book2?.name = "Bu, tolong Sarah"
        book2?.summarySignLanguage = "sl_b2"
        book2?.word = wordTolong
        book2?.categories = [categoryRumah! as Category, categoryLingkungan! as Category, categorySekolah! as Category]
        
        // MARK: Create StoryPage Sarah dan Bahaya Tersembunyi
        let book2StoryPage1 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage1?.name = "Sarah bermain bola di halaman rumahnya lalu bolanya tersangkut di atas pohon."
        book2StoryPage1?.order = 1
        book2StoryPage1?.signLanguage = "sl_b2_sp1"
        book2StoryPage1?.illustration = "il_b2_sp1"
        book2StoryPage1?.desc = ""
        book2StoryPage1?.book = book2
        
        let book2StoryPage2 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage2?.name = "Sarah berusaha menggapainya namun tidak bisa. Kemudian Sarah memanggil Ibunya"
        book2StoryPage2?.order = 2
        book2StoryPage2?.signLanguage = "sl_b2_sp2"
        book2StoryPage2?.illustration = "il_b2_sp2"
        book2StoryPage2?.desc = ""
        book2StoryPage2?.book = book2
        
        let book2StoryPage3 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage3?.name = "“Bu, bola Sarah tersangkut. Tolong ambilkan, bu” Ucap Sarah kepada Ibu"
        book2StoryPage3?.order = 3
        book2StoryPage3?.signLanguage = "sl_b2_sp3"
        book2StoryPage3?.illustration = "il_b2_sp3"
        book2StoryPage3?.desc = ""
        book2StoryPage3?.book = book2
        
        let book2StoryPage4 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage4?.name = "bu segera membantu. Ibu meraih bola dari atas pohon dan memberikannya kepada Sarah"
        book2StoryPage4?.order = 4
        book2StoryPage4?.signLanguage = "sl_b2_sp4"
        book2StoryPage4?.illustration = "il_b2_sp4"
        book2StoryPage4?.desc = ""
        book2StoryPage4?.book = book2
        
        let book2StoryPage5 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage5?.name = "Keesokan harinya, Di perpustakaan, Sarah ingin mengambil buku dari rak"
        book2StoryPage5?.order = 5
        book2StoryPage5?.signLanguage = "sl_b2_sp5"
        book2StoryPage5?.illustration = "il_b2_sp5"
        book2StoryPage5?.desc = ""
        book2StoryPage5?.book = book2
        
        let book2StoryPage6 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage6?.name = "Tapi, Sarah tidak bisa mengambil buku itu karena rak yang tinggi"
        book2StoryPage6?.order = 6
        book2StoryPage6?.signLanguage = "sl_b2_sp6"
        book2StoryPage6?.illustration = "il_b2_sp6"
        book2StoryPage6?.desc = ""
        book2StoryPage6?.book = book2
        
        let book2StoryPage7 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage7?.name = "Sarah melihat bu Guru. Lalu Sarah berkata “Bu guru, Tolong ambilkan aku buku itu” "
        book2StoryPage7?.order = 7
        book2StoryPage7?.signLanguage = "sl_b2_sp7"
        book2StoryPage7?.illustration = "il_b2_sp7"
        book2StoryPage7?.desc = ""
        book2StoryPage7?.book = book2
        
        let book2StoryPage8 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage8?.name = "Ibu guru membantu Sarah mengambil buku"
        book2StoryPage8?.order = 8
        book2StoryPage8?.signLanguage = "sl_b2_sp8"
        book2StoryPage8?.illustration = "il_b2_sp8"
        book2StoryPage8?.desc = ""
        book2StoryPage8?.book = book2
        
        let book2StoryPage9 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage9?.name = "Sarah tidak lupa mengucapkan terimakasih kepada Bu guru yang sudah membantu Sarah"
        book2StoryPage9?.order = 9
        book2StoryPage9?.signLanguage = "sl_b2_sp9"
        book2StoryPage9?.illustration = "il_b2_sp9"
        book2StoryPage9?.desc = ""
        book2StoryPage9?.book = book2
        
        let book2StoryPage10 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage10?.name = "Sepulang sekolah, Sarah dan Ario bermain di taman"
        book2StoryPage10?.order = 10
        book2StoryPage10?.signLanguage = "sl_b2_sp10"
//        book2StoryPage10?.illustration = "il_b2_sp10"
        book2StoryPage10?.desc = ""
        book2StoryPage10?.book = book2
        
        let book2StoryPage11 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage11?.name = "Saat asik bermain, Ario tersandung batu dan menangis"
        book2StoryPage11?.order = 11
        book2StoryPage11?.signLanguage = "sl_b2_sp11"
//        book2StoryPage11?.illustration = "il_b2_sp11"
        book2StoryPage11?.desc = ""
        book2StoryPage11?.book = book2
        
        let book2StoryPage12 = PersistenceController.shared.create(StoryPage.self)
        book2StoryPage12?.name = "“Tolong.. tolong, kak Sarah tolong aku” Ucap Ario kesakitan"
        book2StoryPage12?.order = 12
        book2StoryPage12?.signLanguage = "sl_b2_sp12"
//        book2StoryPage12?.illustration = "il_b2_sp12"
        book2StoryPage12?.desc = ""
        book2StoryPage12?.book = book2
        
        // MARK: Create Q&A Tirukan Bu, Tolong Sarah
        let book2Question = PersistenceController.shared.create(Question.self)
        book2Question?.name = "Tirukan"
        book2Question?.type = 0
        book2Question?.order = 0
//        book2Question1?.signLanguage = "sl_b2_q1"
//        book2Question1?.illustration = "il_b2_q1"
        book2Question?.isDone = false
        book2Question?.book = book2
        
        // MARK: Create Q&A DoDont 1 Bu, tolong Sarah
        let book2Question1 = PersistenceController.shared.create(Question.self)
        book2Question1?.name = "Bola tersangkut di pohon"
        book2Question1?.type = 1
        book2Question1?.order = 1
        book2Question1?.signLanguage = "sl_b2_q1"
//        book2Question1?.illustration = "il_b2_q1"
        book2Question1?.isDone = false
        book2Question1?.book = book2
        
        let book2Question1Answer1 = PersistenceController.shared.create(Answer.self)
        book2Question1Answer1?.name = "Meminta bantuan ibu"
        book2Question1Answer1?.type = 1
        book2Question1Answer1?.signLanguage = "sl_b2_q1_a1"
//        book2Question1Answer1?.illustration = "il_b2_q1_a1"
        book2Question1Answer1?.isCorrect = true
        book2Question1Answer1?.question = book2Question1
        
        let book2Question1Answer2 = PersistenceController.shared.create(Answer.self)
        book2Question1Answer2?.name = "Menangis"
        book2Question1Answer2?.type = 1
        book2Question1Answer2?.signLanguage = "sl_b2_q1_a2"
//        book2Question1Answer2?.illustration = "il_b2_q1_a2"
        book2Question1Answer2?.isCorrect = false
        book2Question1Answer2?.question = book2Question1
        
        // MARK: Create Q&A DoDont 2 Bu, tolong Sarah
        let book2Question2 = PersistenceController.shared.create(Question.self)
        book2Question2?.name = "Kesulitan mengambil buku di rak"
        book2Question2?.type = 1
        book2Question2?.order = 2
        book2Question2?.signLanguage = "sl_b2_q1"
//        book2Question2?.illustration = "il_b2_q2"
        book2Question2?.isDone = false
        book2Question2?.book = book2
        
        let book2Question2Answer1 = PersistenceController.shared.create(Answer.self)
        book2Question2Answer1?.name = "marah"
        book2Question2Answer1?.type = 1
        book2Question2Answer1?.signLanguage = "sl_b2_q2_a1"
//        book2Question2Answer1?.illustration = "il_b2_q2_a1"
        book2Question2Answer1?.isCorrect = true
        book2Question2Answer1?.question = book2Question2
        
        let book2Question2Answer2 = PersistenceController.shared.create(Answer.self)
        book2Question2Answer2?.name = "meminta bantuan bu guru"
        book2Question2Answer2?.type = 1
        book2Question2Answer2?.signLanguage = "sl_b2_q2_a2"
//        book2Question2Answer2?.illustration = "il_b2_q2_a2"
        book2Question2Answer2?.isCorrect = false
        book2Question2Answer2?.question = book2Question2
        
        // MARK: Create Q&A DoDont 3 Bu, tolong Sarah
        let book2Question3 = PersistenceController.shared.create(Question.self)
        book2Question3?.name = "Tersandung"
        book2Question3?.type = 1
        book2Question3?.order = 3
        book2Question3?.signLanguage = "sl_b2_q1"
//        book2Question2?.illustration = "il_b2_q2"
        book2Question3?.isDone = false
        book2Question3?.book = book2
        
        let book2Question3Answer1 = PersistenceController.shared.create(Answer.self)
        book2Question3Answer1?.name = "Meminta bantuan kakak"
        book2Question3Answer1?.type = 1
//        book2Question3Answer1?.illustration = "il_b2_q2_a1"
        book2Question3Answer1?.isCorrect = true
        book2Question3Answer1?.question = book2Question3
        
        let book2Question3Answer2 = PersistenceController.shared.create(Answer.self)
        book2Question3Answer2?.name = "berlari"
        book2Question3Answer2?.type = 1
//        book2Question2Answer2?.illustration = "il_b2_q2_a2"
        book2Question3Answer2?.isCorrect = false
        book2Question3Answer2?.question = book2Question3
        
        // MARK: Create Q&A PG 1 Bu, tolong Sarah
        let book2Question4 = PersistenceController.shared.create(Question.self)
        book2Question4?.name = "Pilih dua gambar di bawah yang menunjukkan situasi yang tepat untuk menggunakan kata tolong?"
        book2Question4?.type = 2
        book2Question4?.order = 4
        book2Question4?.signLanguage = "sl_b2_q2"
//        book2Question3?.illustration = "il_b2_q3"
        book2Question4?.isDone = false
        book2Question4?.book = book2
        
        let book2Question4Answer1 = PersistenceController.shared.create(Answer.self)
        book2Question4Answer1?.name = "Bola tersangkut di pohon"
        book2Question4Answer1?.type = 1
//        book2Question4Answer1?.illustration = "il_b1_q3_a1"
        book2Question4Answer1?.isCorrect = true
        book2Question4Answer1?.question = book2Question4
        
        let book2Question4Answer2 = PersistenceController.shared.create(Answer.self)
        book2Question4Answer2?.name = "Mengambil buku di rak yang tinggi"
        book2Question4Answer2?.type = 1
//        book2Question4Answer2?.illustration = "il_b1_q3_a2"
        book2Question4Answer2?.isCorrect = true
        book2Question4Answer2?.question = book2Question4
        
        let book2Question4Answer3 = PersistenceController.shared.create(Answer.self)
        book2Question4Answer3?.name = "Membaca buku di meja"
        book2Question4Answer3?.type = 1
//        book2Question4Answer3?.illustration = "il_b1_q3_a3"
        book2Question4Answer3?.isCorrect = false
        book2Question4Answer3?.question = book2Question4
        
        // MARK: Create Q&A PG 2 Bu, tolong Sarah
        let book2Question5 = PersistenceController.shared.create(Question.self)
        book2Question5?.name = "Pilih dua gambar di bawah yang menunjukkan situasi yang tepat untuk menggunakan kata tolong?"
        book2Question5?.type = 2
        book2Question5?.order = 5
        book2Question5?.signLanguage = "sl_b2_q2"
        book2Question5?.isDone = false
        book2Question5?.book = book2
        
        let book2Question5Answer1 = PersistenceController.shared.create(Answer.self)
        book2Question5Answer1?.name = "Menonton televisi"
        book2Question5Answer1?.type = 1
//        book2Question5Answer1?.illustration = "il_b1_q3_a1"
        book2Question5Answer1?.isCorrect = false
        book2Question5Answer1?.question = book2Question5
        
        let book2Question5Answer2 = PersistenceController.shared.create(Answer.self)
        book2Question5Answer2?.name = "Mengambil buku di rak yang tinggi"
        book2Question5Answer2?.type = 1
//        book2Question5Answer2?.illustration = "il_b1_q3_a2"
        book2Question5Answer2?.isCorrect = true
        book2Question5Answer2?.question = book2Question5
        
        let book2Question5Answer3 = PersistenceController.shared.create(Answer.self)
        book2Question5Answer3?.name = "Terjatuh dan kesakitan"
        book2Question5Answer3?.type = 1
//        book2Question5Answer3?.illustration = "il_b1_q3_a3"
        book2Question5Answer3?.isCorrect = true
        book2Question5Answer3?.question = book2Question5
        
        // MARK: Create Q&A PG 2 Bu, tolong Sarah
        let book2Question6 = PersistenceController.shared.create(Question.self)
        book2Question6?.name = "Pilih dua gambar di bawah yang menunjukkan situasi yang tepat untuk menggunakan kata tolong?"
        book2Question6?.type = 2
        book2Question6?.order = 6
        book2Question6?.signLanguage = "sl_b2_q2"
        book2Question6?.isDone = false
        book2Question6?.book = book2
        
        let book2Question6Answer1 = PersistenceController.shared.create(Answer.self)
        book2Question6Answer1?.name = "Terjatuh dan kesakitan"
        book2Question6Answer1?.type = 1
//        book2Question3Answer1?.illustration = "il_b1_q3_a1"
        book2Question6Answer1?.isCorrect = true
        book2Question6Answer1?.question = book2Question6
        
        let book2Question6Answer2 = PersistenceController.shared.create(Answer.self)
        book2Question6Answer2?.name = "Bola tersangkut di pohon"
        book2Question6Answer2?.type = 1
//        book2Question3Answer2?.illustration = "il_b1_q3_a2"
        book2Question6Answer2?.isCorrect = true
        book2Question6Answer2?.question = book2Question6
        
        let book2Question6Answer3 = PersistenceController.shared.create(Answer.self)
        book2Question6Answer3?.name = "Membaca buku di meja"
        book2Question6Answer3?.type = 1
//        book2Question6Answer3?.illustration = "il_b1_q3_a3"
        book2Question6Answer3?.isCorrect = false
        book2Question6Answer3?.question = book2Question6
        
        // MARK: Create Q&A Hubungkan Bu, tolong Sarah
        let book2Question7 = PersistenceController.shared.create(Question.self)
        book2Question7?.name = "Hubungkan gambar di bawah ini yang sesuai"
        book2Question7?.type = 3
        book2Question7?.order = 7
        book2Question7?.isDone = false
        book2Question7?.book = book2
        
        let book2Question7Answer1 = PersistenceController.shared.create(Answer.self)
        book2Question7Answer1?.name = "Mainan tersangkut di pohon -> Minta tolong ibu"
        book2Question7Answer1?.type = 2
        book2Question7Answer1?.illustration = "illust_dummy"
        book2Question7Answer1?.illustration1 = "illust_dummy"
        book2Question7Answer1?.isCorrect = true
        book2Question7Answer1?.question = book2Question7
        
        let book2Question7Answer2 = PersistenceController.shared.create(Answer.self)
        book2Question7Answer2?.name = "Mainan terjebak di taman -> Minta bantuan teman"
        book2Question7Answer2?.type = 2
        book2Question7Answer2?.illustration = "il_b_default"
        book2Question7Answer2?.illustration1 = "il_b_default"
        book2Question7Answer2?.isCorrect = true
        book2Question7Answer2?.question = book2Question7
        
        let book2Question7Answer3 = PersistenceController.shared.create(Answer.self)
        book2Question7Answer3?.name = "Buku di rak tinggi -> Minta bantuan bu guru"
        book2Question7Answer3?.type = 2
        book2Question7Answer3?.illustration = "background-word-summary"
        book2Question7Answer3?.illustration1 = "background-word-summary"
        book2Question7Answer3?.isCorrect = false
        book2Question7Answer3?.question = book2Question7
        
        do{
            try PersistenceController.shared.viewContext.save()
        }catch(let error){
            print(error)
        }
    }
}

extension Data {
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = PersistenceController.shared.viewContext
        return decoder
    }
    
    func toCategory() -> [Category]? {
        return try? decoder.decode([Category].self, from: self)
    }
    
    func toBooks() -> [Book]?{
        return try? decoder.decode([Book].self, from: self)
    }
}
