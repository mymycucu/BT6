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
        
        // MARK: Create word
        let wordBahaya = PersistenceController.shared.create(Word.self)
        wordBahaya?.name = "Bahaya"
        wordBahaya?.signLanguage = "sl_word_bahaya"
        
        let wordTolong = PersistenceController.shared.create(Word.self)
        wordTolong?.name = "Tolong"
        wordTolong?.signLanguage = "sl_word_tolong"
        
        // MARK: Create Book1 Sarah dan Bahaya Tersembunyi
        let book1 = PersistenceController.shared.create(Book.self)
        book1?.name = "Sarah dan Bahaya Tersembunyi"
        book1?.word = wordBahaya
        book1?.categories = [categoryRumah! as Category, categoryLingkungan! as Category]
        
        // MARK: Create StoryPage Sarah dan Bahaya Tersembunyi
        let book1StoryPage1 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage1?.name = "Di pagi yang cerah, Sarah sedang sarapan bersama ibu"
        book1StoryPage1?.order = 1
        book1StoryPage1?.signLanguage = "sl_b1_sp1"
        book1StoryPage1?.illustration = "il_b1_sp1"
        book1StoryPage1?.desc = ""
        book1StoryPage1?.book = book1
        
        let book1StoryPage2 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage2?.name = "Tidak sengaja, Sarah menumpahkan air dalam gelas. “Byur”"
        book1StoryPage2?.order = 2
        book1StoryPage2?.signLanguage = "sl_b1_sp2"
        book1StoryPage2?.illustration = "il_b1_sp2"
        book1StoryPage2?.desc = ""
        book1StoryPage2?.book = book1
        
        let book1StoryPage3 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage3?.name = "Ibu berkata “Airnya tumpah ya, yuk kita bersihkan bersama, bahaya tergelincir”"
        book1StoryPage3?.order = 3
        book1StoryPage3?.signLanguage = "sl_b1_sp3"
        book1StoryPage3?.illustration = "il_b1_sp3"
        book1StoryPage3?.desc = ""
        book1StoryPage3?.book = book1
        
        let book1StoryPage4 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage4?.name = "Air yang tumpah di lantai harus segera dibersihkan karena dapat menyebabkan Sarah dan Ibu tergelincir"
        book1StoryPage4?.order = 4
        book1StoryPage4?.signLanguage = "sl_b1_sp4"
        book1StoryPage4?.illustration = "il_b1_sp4"
        book1StoryPage4?.desc = ""
        book1StoryPage4?.book = book1
        
        let book1StoryPage5 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage5?.name = "Di jalan menuju sekolah, mereka melihat lampu lalu lintas berwarna merah"
        book1StoryPage5?.order = 5
        book1StoryPage5?.signLanguage = "sl_b1_sp5"
        book1StoryPage5?.illustration = "il_b1_sp5"
        book1StoryPage5?.desc = ""
        book1StoryPage5?.book = book1
        
        let book1StoryPage6 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage6?.name = "“Merah berarti berhenti, kita menunggu ya” kata Ibu"
        book1StoryPage6?.order = 6
        book1StoryPage6?.signLanguage = "sl_b1_sp6"
        book1StoryPage6?.illustration = "il_b1_sp6"
        book1StoryPage6?.desc = ""
        book1StoryPage6?.book = book1
        
        let book1StoryPage7 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage7?.name = "Ketika lampu berubah menjadi hijau, mereka berjalan dengan aman ke sekolah"
        book1StoryPage7?.order = 7
        book1StoryPage7?.signLanguage = "sl_b1_sp7"
        book1StoryPage7?.illustration = "il_b1_sp7"
        book1StoryPage7?.desc = ""
        book1StoryPage7?.book = book1
        
        let book1StoryPage8 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage8?.name = "Sesampainya di sekolah, Sarah melihat ada gunting di atas meja"
        book1StoryPage8?.order = 8
        book1StoryPage8?.signLanguage = "sl_b1_sp8"
        book1StoryPage8?.illustration = "il_b1_sp8"
        book1StoryPage8?.desc = ""
        book1StoryPage8?.book = book1
        
        let book1StoryPage9 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage9?.name = "“Sarah tidak bermain dengan gunting di sekolah ya, itu berbahaya dan bisa menyakiti kita” kata Ibu guru"
        book1StoryPage9?.order = 9
        book1StoryPage9?.signLanguage = "sl_b1_sp9"
        book1StoryPage9?.illustration = "il_b1_sp9"
        book1StoryPage9?.desc = ""
        book1StoryPage9?.book = book1
        
        let book1StoryPage10 = PersistenceController.shared.create(StoryPage.self)
        book1StoryPage10?.name = "Sarah mengangguk tanda mengerti untuk berhati-hati dengan gunting"
        book1StoryPage10?.order = 10
        book1StoryPage10?.signLanguage = "sl_b1_sp10"
        book1StoryPage10?.illustration = "il_b1_sp10"
        book1StoryPage10?.desc = ""
        book1StoryPage10?.book = book1
        
        // MARK: Create Questions Sarah dan Bahaya Tersembunyi
        let book1Question1 = PersistenceController.shared.create(Question.self)
        book1Question1?.name = "Hubungkan gambar di bawah ini yang sesuai"
        book1Question1?.type = 0
        book1Question1?.order = 1
        book1Question1?.signLanguage = "sl_b1_q1"
        book1Question1?.illustration = "il_b1_q1"
        book1Question1?.isDone = false
        book1Question1?.book = book1
        
        let book1Question2 = PersistenceController.shared.create(Question.self)
        book1Question2?.name = "Pilih gambar yang termasuk kegiatan bahaya"
        book1Question2?.type = 0
        book1Question2?.order = 1
        book1Question2?.signLanguage = "sl_b1_q2"
        book1Question2?.illustration = "il_b1_q2"
        book1Question2?.isDone = false
        book1Question2?.book = book1
        
        // MARK: Create Answer Sarah dan Bahaya Tersembunyi
        let book1Question2Answer1 = PersistenceController.shared.create(Answer.self)
        book1Question2Answer1?.name = "Menyeberang jalan saat lampu merah"
        book1Question2Answer1?.type = 1
        book1Question2Answer1?.signLanguage = "sl_b1_q2_a1"
        book1Question2Answer1?.illustration = "il_b1_q2_a1"
        book1Question2Answer1?.isCorrect = true
        book1Question2Answer1?.question = book1Question2
        
        let book1Question1Answer2 = PersistenceController.shared.create(Answer.self)
        book1Question1Answer2?.name = "Bermain dengan mainan"
        book1Question1Answer2?.type = 1
        book1Question1Answer2?.signLanguage = "sl_b1_q2_a2"
        book1Question1Answer2?.illustration = "il_b1_q2_a2"
        book1Question1Answer2?.isCorrect = false
        book1Question1Answer2?.question = book1Question2
        
        let book1Question1Answer3 = PersistenceController.shared.create(Answer.self)
        book1Question1Answer3?.name = "Membersihkan air"
        book1Question1Answer3?.type = 1
        book1Question1Answer3?.signLanguage = "sl_b1_q2_a3"
        book1Question1Answer3?.illustration = "il_b1_q2_a3"
        book1Question1Answer3?.isCorrect = false
        book1Question1Answer3?.question = book1Question2
        
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
