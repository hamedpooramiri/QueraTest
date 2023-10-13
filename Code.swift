import Foundation

//
//ماریو که با دست خالی حریف کینگ کوپا نمی‌شود، تصمیم به خرید شمشیر ویژه می‌گیرد. ماریو
//�
//�
//C
//M
//
//  سکه و
//�
//�
//G
//M
//
//  الماس دارد. از طرفی شمشیر ویژه به
//�
//�
//C
//S
//
//  سکه و
//�
//�
//G
//S
//
//  الماس نیاز دارد.
//
//همچنین به شما عدد صحیح
//�
//�
//�
//�
//rate نشان‌دهنده تعداد سکه در ازای یک الماس داده می‌شود و ماریو می‌تواند با دادن
//�
//�
//�
//�
//rate سکه یک الماس بگیرد ویا یک الماس بدهد و
//�
//�
//�
//�
//rate سکه دریافت کند.
//
//ماریو تبدیل را به تعداد دلخواه می‌تواند تکرار کند. آیا می‌تواند شمشیر ویژه را بخرد؟
//
//توضیح تصویر
//
//توجه کنید اگر شمشیر ویژه را بخرد می‌تواند کینگ‌کوپا را شکست دهد و شهر قارچ‌ها و شاهزاده خانم در امان می‌مانند. :)
//
//ورودی
//در سطر اول ورودی به ترتیب از چپ به راست دو عدد می‌آید که اولی
//�
//�
//C
//M
//
//  و دومی
//�
//�
//G
//M
//
//  خواهد بود. در سطر بعدی هم دو عدد
//�
//�
//C
//S
//
//  و
//�
//�
//G
//S
//
//  خواهند آمد. و در سطر سوم هم
//�
//�
//�
//�
//rate که یک عدد صحیح است خواهد آمد.
//
//0
//≤
//�
//�
//,
//�
//�
//,
//�
//�
//,
//�
//�
//≤
//1
//0
//0≤C
//M
//
// ,G
//M
//
// ,C
//S
//
// ,G
//S
//
// ≤10
//1
//≤
//�
//�
//�
//�
//≤
//1
//0
//1≤rate≤10
//
//خروجی
//در تنها سطر خروجی اگر ماریو می‌توانست شمشیر ویژه را بخرد Yes و در غیر اینصورت No را خروجی دهید.



struct UserInput {
    let Cm: Int
    let Gm: Int
}

struct SordCost {
    let Cs: Int
    let Gs: Int
}

func assess(userInput: UserInput, sordCost: SordCost, rate: Int) -> String{
    if userInput.Cm >= sordCost.Cs && userInput.Gm >= sordCost.Gs {
        return "Yes"
    }
    
    if userInput.Cm > sordCost.Cs {
        let newGem = ((userInput.Cm - sordCost.Cs) / rate)
        let totalGm = userInput.Gm + newGem
        if totalGm >= sordCost.Gs {
            return "Yes"
        }
    }
    
    if userInput.Gm > sordCost.Gs {
        let newCoins = ((userInput.Gm - sordCost.Gs) * rate)
        let totalCoins = userInput.Cm + newCoins
        if totalCoins >= sordCost.Cs {
            return "Yes"
        }
    }
    
    return "No"
}

func Main() {
    let firstLine = (readLine()?.components(separatedBy: " "))?.compactMap { Int($0) }
    let secendLine = (readLine()?.components(separatedBy: " "))?.compactMap { Int($0) }
    let rate = Int(readLine() ?? "0") ?? 0
    
    if let cm = firstLine?[0], let gm = firstLine?[1], let cs = secendLine?[0], let gs = secendLine?[1] {
       print(assess(userInput: UserInput(Cm: cm, Gm: gm),
               sordCost: SordCost(Cs: cs, Gs: gs),
               rate: rate))
    } else {
        print("No")
    }
}

Main()
