select * from public.customercustomerdemo

select * from public.customerdemographics

DROP TABLE public.customercustomerdemo
DROP TABLE public.customerdemographics

-- yukarıdaki iki tabloda veri olmadığı için sildim.


select * from public.shippers

select * from public.shippers_tmp

DROP TABLE public.shippers_tmp

-- yukarıdaki iki tablo içeriği de aynı olduğu için shipper_tmp isimli tabloyu sildim.


--ANALİZLERİM--

-- MÜŞTERİ ANALİZİ --

-- Müşteri analizinde aşağıdaki alt başlıklarda neden analiz yaptım şu şekilde açıklayabilirim;
-- Analizleri yaparken amacım veri odaklı bir iyileştirme stratejisi geliştirebilmek.
-- Örneğin; bir firmamız olsun ve firmamızın, bir e-ticaret platformu olan ABC E-Ticaret'in 
-- başarıyı artırmak ve rekabet avantajını korumak için veri odaklı bir yaklaşım benimsemesi 
-- gerekiyor. Bu bağlamda, müşteri analizi, işletmenin başarısını artırmak ve 
-- müşteri memnuniyetini en üst düzeye çıkarmak için kritik bir rol oynamaktadır.

-- 1. Toplam Müşteri Sayısı Analizi:
-- Toplam müşteri sayısı analizi, firmanın büyüme trendini anlamak için önemli olduğunu düşünüyorum. 
-- Bu analiz ile elde edilen sonuçlara göre pazar payımızı artırmak veya korumak için stratejiler geliştirmemize yardımcı olabilir. 
-- Örneğin, müşteri tabanımızda bir düşüş fark edersek, pazarlama stratejilerimizi gözden geçirip 
-- müşteri edinme sürecini iyileştirebiliriz. 

-- 2. Ülkelere Göre Müşteri Dağılımı Analizi:
-- Ülkelere göre müşteri dağılımı analizi, hedef pazarlarımızı belirlememize ve 
-- uluslararası genişleme stratejilerimizi optimize etmemize yardımcı olabilir. 
-- Hangi bölgelerdeki müşteri tabanımızın büyüdüğünü veya azaldığını anlamak, 
-- pazarlama ve operasyonel kaynaklarınızı doğru bir şekilde yönlendirmemize olanak tanır.

-- 3. Müşteri Segmentasyon Analizi:
-- Müşteri segmentasyonu, farklı müşteri gruplarını belirleyerek onlara özelleştirilmiş 
-- bir deneyim sunmamızı sağlar. 
-- Bu analiz, müşterilerimizi daha iyi anlamamıza ve onların ihtiyaçlarını karşılayacak 
-- ürün ve hizmetleri geliştirmemize yardımcı olabilir. 
-- Örneğin, sadık müşterilerle ilişkilerimizi güçlendirmek veya potansiyel yüksek değerli 
-- müşterileri belirlemek için segmentasyon stratejileri uygulayabiliriz.

-- 4. Müşteri Yaşam Döngüsü Analizi:
-- Müşteri yaşam döngüsü analizi, bir müşterinin işletme ile etkileşimlerinin farklı 
-- aşamalarını belirlemek ve anlamak için kullanılan bir stratejik analiz yöntemidir. 
-- Bu analiz, müşterilerin ilk kez fark edildiği andan itibaren satın alma, sadakat ve ayrılma 
-- gibi farklı aşamalardan geçtiğini kabul eder. 
-- Bu aşamalar genellikle "Kazanım-Edinme(Acquisition)", "Katılım(Engagement)", 
-- "Saklama(Retention)" ve "Ayrılma(Churn)" olarak adlandırılır. 
-- Müşteri yaşam döngüsü analizi, her aşamanın müşteri davranışını ve ihtiyaçlarını anlamak, 
-- uygun pazarlama stratejileri geliştirmek ve müşteri deneyimini 
-- iyileştirmek için önemli bir araçtır.

-- 5. Müşteri Başına Ortalama Sipariş Sayısı Analizi:
-- Müşteri başına ortalama sipariş sayısı analizi, müşterilerin alışveriş alışkanlıklarını 
-- anlamamıza ve ortalama sipariş değerini artırmamıza yardımcı olur. 
-- Bu analiz, çapraz satış fırsatlarını belirlemek ve müşteriye özel teklifler 
-- sunmak için kullanılabilir.

-- 6. RFM Analizi:
-- RFM analizi, müşteri değerlendirmesi için etkili bir araçtır. Müşterilerimizi rekabetçi 
-- bir şekilde sınıflandırarak, hangi müşterilerin daha fazla dikkat ve kaynak gerektirdiğini 
-- anlamamıza yardımcı olabilir. 
-- Bu analiz, müşteri sadakati, değer ve potansiyelini değerlendirerek, pazarlama ve 
-- satış stratejilerimizi optimize etmemizi sağlar.

-- Tüm bu analizlerin amacı, firmanın müşteri odaklı bir yaklaşım benimsemesini sağlamak ve 
-- işletmenin büyüme potansiyelini maksimize etmektir. 
-- Veri odaklı kararlar alarak, müşteri memnuniyetini artırabilir, rekabet avantajını koruyabilir
-- ve uzun vadeli başarıyı sağlayabiliriz.

-- 1) Toplam Müşteri Sayısı
SELECT COUNT(customer_id) AS total_customers
FROM customers
;

-- 1.a) 1996/1997/1998 yıllarına ait müşteri sayıları
-- Bu verilere dayanarak, 1996, 1997 ve 1998 yıllarına ait müşteri sayıları ve sipariş dağılımları hakkında bazı çıkarımlar yapabiliriz:
-- 1996 Yılı: 
-- 1996 yılında 67 müşteri bulunmaktadır.
-- Ancak, veri setinde sadece 7-8-9-10-11-12 aylarına ait siparişler bulunmaktadır.
-- Bu durum, veri setinin 1996 yılının sadece ikinci yarısını temsil ettiğini göstermektedir.
-- Müşteri sayısının yüksek olmasına rağmen, veri eksikliği nedeniyle yıl boyunca 
-- tam bir resim elde etmek mümkün değildir.

-- 1997 Yılı:
-- 1997 yılında 86 müşteri bulunmaktadır.
-- Veri seti, tüm aylara ait siparişleri içermektedir, bu da yıl boyunca sürekli bir 
-- iş hacmi olduğunu göstermektedir.
-- Müşteri sayısının artması, firmanın müşteri tabanını genişletme çabalarının 
-- olumlu sonuçlarını yansıtabilir.

-- 1998 Yılı:
-- 1998 yılında 81 müşteri bulunmaktadır.
-- Ancak, sadece 1-2-3-4-5 aylarına ait siparişler veri setinde bulunmaktadır.
-- Bu durum, veri setinin yılın ilk yarısını temsil ettiğini ve yılın geri kalanında 
-- veri eksikliği olduğunu göstermektedir.
-- Fakat 1997 yılıyla kıyaslandığında o yılda bütün ayların toplamında 86 müşteri var iken
-- 1998 yılında sadece ilk beş ayda 81 müşteriye ulaşılmıştır. 
-- Bu da yapılan pazarlama stratejelerinin, kampanyaların, çıkılan reklamların, belki yapılan
-- promosyonların olumlu sonuç verdiği şeklinde yorumlanabilir.
SELECT 
    COUNT(DISTINCT CASE WHEN EXTRACT(YEAR FROM order_date) = 1996 THEN customer_id END) AS total_customers_1996,
    COUNT(DISTINCT CASE WHEN EXTRACT(YEAR FROM order_date) = 1997 THEN customer_id END) AS total_customers_1997,
    COUNT(DISTINCT CASE WHEN EXTRACT(YEAR FROM order_date) = 1998 THEN customer_id END) AS total_customers_1998
FROM 
    orders;


-- 2) Ülkelere Göre Müşteri Dağılımı Analizi
SELECT country, COUNT(customer_id) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;


-- 3) Müşteri Segmentasyon Analizi-- PYTHON'DA GÖRSELLEŞTİRDİM 
-- Müşterileri farklı segmentlere ayırarak, 
-- her bir segmentin davranışlarını ve gereksinimlerini analiz edebiliriz.
SELECT 
    CASE
        WHEN total_orders > 10 THEN 'Loyal'
        WHEN total_orders > 5 THEN 'Regular'
        ELSE 'Occasional'
    END AS customer_segment,
    COUNT(customer_id) AS total_customers,
    ROUND(SUM(order_amount)::numeric, 2) AS total_sales_amount
FROM (
    SELECT 
        o.customer_id,
        COUNT(*) AS total_orders,
        SUM(od.quantity * od.unit_price) AS order_amount
    FROM 
        orders o
    INNER JOIN 
        order_details od ON o.order_id = od.order_id
    GROUP BY 
        o.customer_id
) AS order_counts
GROUP BY 
    customer_segment
;

--4) Müşteri Yaşam Döngüsü Analizi: PYTHON'DA GÖRSELLEŞTİRDİM.

-- Bu sorgu, müşterilerin farklı yaşam döngüsü aşamalarına 
-- (kazanım, katılım, saklama, ayrılma) göre segmentasyonunu sağlar.

--Müşteri yaşam döngüsü analizi, bir işletmenin müşterileriyle ilişkilerini anlamak ve yönetmek 
--için kullanılan bir stratejik araçtır. Bu analiz, müşterilerin işletmeyle olan etkileşimlerini
--belirli aşamalara böler ve her aşamada müşteri davranışlarını anlamak için farklı stratejilerin
--uygulanmasını sağlar.

--Müşteri yaşam döngüsü genellikle dört ana aşamaya ayrılır:

--1.Katılım-Edinme (Acquisition): Müşterinin ilk kez işletmeyle etkileşime girdiği aşamadır. 
--Bu aşamada, müşteri potansiyel olarak ürün veya hizmeti ilk kez satın alır veya hizmeti kullanır. Edinme aşamasında, işletme genellikle pazarlama ve reklam stratejilerini kullanarak yeni müşteriler çekmeye odaklanır.

--2.Katılım (Engagement): Müşterinin işletmeyle etkileşimini artırdığı ve bağlantı kurduğu aşamadır. Müşteri, tekrarlayan satın almalar yapabilir, ürün veya hizmetle etkileşimde bulunabilir veya işletmeyle iletişim kurabilir. Bu aşamada, işletme genellikle müşteri sadakatini artırmak için müşteri deneyimini iyileştirme ve müşteri ilişkilerini güçlendirme stratejileri uygular.

--3.Saklama (Retention): Müşterinin işletmeyle olan ilişkisini devam ettirdiği aşamadır. 
--Müşteri, işletmenin ürünlerini veya hizmetlerini düzenli olarak satın alır ve işletmeyle uzun vadeli bir ilişki kurar. Bu aşamada, işletme genellikle müşteri memnuniyetini ve sadakatini korumak için müşteri destek ve sadakat programları gibi stratejiler uygular.

--4.Ayrılma (Churn): Müşterinin işletmeyle olan ilişkisini sonlandırdığı aşamadır. 
--Müşteri ürün veya hizmeti artık satın almaz veya işletmeyle iletişim kurmaz. 
--Bu aşamada, işletme genellikle müşteri kaybını azaltmak için müşteri geri kazanım stratejileri uygular.

--Müşteri yaşam döngüsü analizi, işletmelere hangi aşamada müşterilerin bulunduğunu 
--anlamalarına yardımcı olur ve bu bilgiye dayanarak uygun stratejiler geliştirmelerini sağlar. 
--Bu analiz, müşteri davranışlarını tahmin etme, pazarlama çabalarını yönlendirme, 
--müşteri deneyimini iyileştirme ve müşteri sadakatini artırma gibi birçok alanda fayda sağlar.
SELECT 
    customer_lifecycle_stage,
    COUNT(customer_id) AS total_customers
FROM (
    SELECT 
        customer_id,
        CASE 
            WHEN total_orders < 5 THEN 'Acquisition'
            WHEN total_orders < 10 THEN 'Engagement'
            WHEN total_orders < 15 THEN 'Retention'
            ELSE 'Churn'
        END AS customer_lifecycle_stage
    FROM (
        SELECT 
            customer_id,
            COUNT(*) AS total_orders
        FROM 
            orders
        GROUP BY 
            customer_id
    ) AS order_counts
) AS lifecycle_stages
GROUP BY 
    customer_lifecycle_stage;
	

-- 5) Müşteri Başına Ortalama Sipariş Sayısı Analizi
-- Her müşterinin ortalama sipariş sayısını bulabiliriz.

-- Yazdığım bu SQL kodu, her müşterinin kaç adet sipariş verdiğini göstermektedir. 
-- Bu bilgi, müşterilerin alışveriş alışkanlıkları ve firmaların müşteri tabanı 
-- hakkında bir fikir verir.Örneğin:

-- En Aktif Müşterileri Belirleme: En yüksek sipariş sayısına sahip müşterileri bulabiliriz. 
-- Bu müşterilerle olan ilişkileri daha da güçlendirmek veya onlara özel teklifler sunmak gibi 
-- stratejiler geliştirilebilir.

-- Müşteri Sadakati Analizi: Düzenli olarak sipariş veren müşteriler belirlenebilir.
-- Belirli bir zaman diliminde belirli bir sayıda veya daha fazla sipariş veren müşterileri 
-- tanımlamak, firmaların sadakat programları veya ödüllendirme sistemlerini 
-- optimize etmeye yardımcı olabilir.

-- Ürün veya Hizmet Tercihlerini Belirleme: Her müşterinin sipariş sayısını inceleyerek, 
-- hangi ürün veya hizmetlerin daha popüler olduğu belirlenebilir. Bu, pazarlama stratejilerini ve 
-- ürün/hizmet portföyünün daha iyi optimize edilmesine yardımcı olabilir.

-- Sipariş Trendlerini Anlama: Zaman içinde müşterilerin sipariş sayısındaki değişiklikleri izlenerek, 
-- belirli dönemlerde veya olaylardan sonra oluşan trendleri anlamak mümkün olabilir.
-- Örneğin, belirli bir ürünün tanıtımı veya indirim kampanyası sonrası siparişlerde artış olup olmadığı görülebilir.

-- Bu analizler, işletmelerin müşterileriyle etkileşimini anlamak ve iş stratejilerini optimize etmek için kullanılabilir. 
-- Müşteri başına ortalama sipariş analizi, müşterilerin alışveriş alışkanlıklarını anlamak ve müşteri tabanını 
-- daha iyi hedeflemek için değerli bir araç olabilir.

-- Müşteriye Ait Toplam Harcanan Tutar: Her müşterinin toplam harcadığı tutarı göstermek, 
-- hangi müşterilerin işletme için daha yüksek gelir getirdiğini anlamaya yardımcı olabilir. 
-- Bu bilgi, pazarlama stratejilerini belirlerken veya müşteri hizmetlerini iyileştirirken 
-- odaklanılmasu gereken müşteri segmentlerini belirlemeye yardımcı olabilir.

-- Müşterinin Bulunduğu Ülke veya Şehir Bilgisi: Her müşterinin bulunduğu ülkeyi veya şehri 
-- göstermek, coğrafi segmentasyon yapmaya ve buna göre pazarlama stratejileri oluşturmaya 
-- olanak tanır. Farklı coğrafi bölgelerdeki müşterilerin farklı tercihleri olabilir ve buna göre 
-- ürün ve hizmetler uyarlanabilir.
SELECT 
    c.customer_id,
	c.contact_name,
    c.country,
    COUNT(distinct o.order_id) AS order_count, 
    CAST(SUM(od.quantity * od.unit_price) AS NUMERIC(10,2)) AS total_spent
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
LEFT JOIN 
    order_details od ON o.order_id = od.order_id
GROUP BY 
    c.customer_id, 
    c.company_name,
    c.country
ORDER BY 
    order_count DESC;
	
	
-- 6) RFM ANALİZİ

-- RFM analizi, "Recency" (yenilik), "Frequency" (sıklık) ve "Monetary" (parasal) 
-- kriterlerini kullanarak müşterileri segmentlere ayırmak ve bu segmentlere özgü 
-- pazarlama stratejileri geliştirmek için kullanılan bir analiz yöntemidir.

-- Bu analiz, müşterilerin satın alma alışkanlıklarına göre 
-- gruplara ayrılmasına yardımcı olur. RFM analizi sonuçları, şirketlere her bir 
-- müşteri segmentinin alışveriş alışkanlıklarını anlamak için önemli bir yol sunar. 
-- Bu da pazarlama stratejilerini buna göre uyarlamayı mümkün kılar.

--- Her bir müşterinin bu segmentlerdeki konumu, onlara özgü pazarlama stratejileri 
-- belirlemek için önemlidir. Örneğin, VIP müşterilere özel indirimler veya sadakat ödülleri 
-- sunarak onların markaya olan bağlılığı artırılabilir. 
-- Daha az aktif olan müşterileri tekrar çekmek için ise özel teklifler veya 
-- kişiselleştirilmiş iletişim stratejileri kullanılabilir.

-- Çünkü günümüzde artık işletmeler, her müşteriye özel kampanyalar ve reklamlar sunmayı hedeflemektedir. 
-- Bu yaklaşımın geri dönüşü daha olumlu ve etkili olmaktadır. 
-- İşte bu nedenle RFM analizi büyük bir öneme sahiptir.

-- Analizde bahsi geçen ifadelerden;
-- Recency (Yenilik): Müşterilerin son alışveriş yapma zamanını belirler. 
-- Her bir müşteri, son alışveriş yapma tarihine göre 
-- VIP, Gold, Silver veya Bronze gibi segmentlere ayrılır. Bu, müşterilerin markalara olan 
-- ilgilerinin ne kadar taze olduğunu ve müşteri sadakati ve ilişkilerinin güncelliğini gösterir.

-- Frequency (Sıklık): Müşterilerin belirli bir zaman diliminde ne sıklıkla alışveriş 
-- yaptıklarını belirler. Yani, müşterinin ne kadar aktif olduğunu ve markayla 
-- ne sıklıkla etkileşimde bulunduğunu gösterir.

-- Monetary (Parasal Değer): Müşterilerin yaptığı alışverişlerin parasal değerini belirler.
-- Bu, müşterilerin markaya ne kadar değer verdiğini ve markaya ne kadar para harcadığını gösterir.

-- RFM analizi, bu üç kriteri kullanarak müşterileri segmentlere ayırır ve her bir segmente özgü 
-- pazarlama stratejileri geliştirilmesine yardımcı olur. 
-- Örneğin, VIP müşterilere özel teklifler veya indirimler sunularak sadakatlerinin 
-- artırılması hedeflenebilir. Aynı şekilde, daha az aktif olan müşterileri tekrar etkilemek için 
-- özel kampanyalar düzenlenebilir.

-- Ben de yaptığım analizde müşterilerimi VIP, Gold, Silver ve Bronz şeklinde kategorilere ayırdım. 
-- Bu segmentasyon sonuçlarına dayalı olarak her bir kategori için farklı pazarlama stratejileri 
-- belirlenebilecektir. Örneğin, 

-- VIP müşteriler; son alışverişlerini son zamanlarda yapmış, sık sık alışveriş yapmış 
-- ve yüksek tutarlı alışverişler yapmışlardır. Bu müşterilere özel teklifler, özel hizmetler 
-- ve ödüller sunarak onların sadakatini pekiştirmek hedeflenebilir.

-- Gold müşteriler; VIP müşterilere benzer şekilde yakın zamanda alışveriş yapmış ve 
-- ortalama sıklıkta alışveriş yapmışlardır. Onlara da özel fırsatlar sunarak sadakatlerini 
-- artırmak amaçlanabilir.

-- Silver müşteriler; biraz daha önce alışveriş yapmış, ortalama sıklıkta alışveriş yapmış 
-- ve ortalama tutarlı alışverişler yapmışlardır. Bu segmentteki müşterilere daha fazla teşvik 
-- ve özel teklifler sunmak istenebilir.

-- Son olarak, Bronze  müşteriler; son alışverişlerini biraz önce yapmış, düşük sıklıkta 
-- alışveriş yapmış ve ortalama veya daha düşük tutarlı alışverişler yapmışlardır. 
-- Bu müşterileri daha fazla ilgi ve teşvikle aktifleştirmek, ona göre uygun kampanyalar çıkmak  hedeflenebilir.
-- Her bir müşteri segmentinin özel ihtiyaçları ve davranışları bulunmaktadır. 

-- Bu nedenle her segment için özelleştirilmiş pazarlama stratejileri geliştirmek, 
-- müşteri memnuniyetini artırmak ve başarıyı garantilemek için çok önemlidir.


-- RECENCY
WITH max_order AS (
    SELECT
        customer_id,
        MAX(order_date) AS max_order_date
    FROM
        orders
    WHERE
        customer_id IS NOT NULL
    GROUP BY
        customer_id
)
SELECT 
    customer_id,
    CURRENT_DATE - MAX(max_order_date) AS recency
FROM 
    max_order
GROUP BY
    customer_id
;
-- FREQUENCY
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS frequency
FROM
    orders
WHERE
    customer_id IS NOT NULL
GROUP BY
    customer_id
;
-- MONETARY
SELECT
    o.customer_id,
    CAST(SUM(od.quantity * od.unit_price) AS NUMERIC(10,2)) AS monetary
FROM
    orders o
JOIN
    order_details od ON o.order_id = od.order_id
WHERE
    od.unit_price > 0 AND od.quantity > 0 AND o.customer_id IS NOT NULL
GROUP BY
    o.customer_id
;


--OVERALL RFM
WITH recency AS (
    WITH max_order AS (
        SELECT
            customer_id,
            MAX(order_date) AS max_order_date
        FROM
            orders
        WHERE
            customer_id IS NOT NULL
        GROUP BY
            customer_id
    )
    SELECT 
        customer_id,
        CURRENT_DATE - MAX(max_order_date) AS recency
    FROM 
        max_order
    GROUP BY
        customer_id
),
frequency AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS frequency
    FROM
        orders
    WHERE
        customer_id IS NOT NULL
    GROUP BY
        customer_id
),
monetary AS (
    SELECT
        o.customer_id,
        SUM(od.quantity * od.unit_price) AS monetary
    FROM
        orders o
    JOIN
        order_details od ON o.order_id = od.order_id
    WHERE
        od.unit_price > 0 AND od.quantity > 0 AND o.customer_id IS NOT NULL
    GROUP BY
        o.customer_id
)
SELECT 
    r.customer_id,
    recency,
    frequency,
    monetary,
    CASE
        WHEN recency <= 10 THEN 'VIP'
        WHEN recency <= 40 THEN 'Gold'
        WHEN recency <= 90 THEN 'Silver'
        ELSE 'Bronze'
    END AS recency_musteri_segmenti,
    CASE
        WHEN frequency <= 5 THEN 'VIP'
        WHEN frequency <= 14 THEN 'Gold'
        WHEN frequency <= 30 THEN 'Silver'
        ELSE 'Bronze'
    END AS frequency_musteri_segmenti,
    CASE
        WHEN monetary <= 300 THEN 'Bronze'
        WHEN monetary <= 1000 THEN 'Silver'
        WHEN monetary <= 5000 THEN 'Gold'
        ELSE 'VIP'
    END AS monetary_musteri_segmenti
FROM 
    recency r
JOIN
    frequency f ON r.customer_id = f.customer_id
JOIN
    monetary m ON r.customer_id = m.customer_id;


	
-- SİPARİŞ ANALİZİ --

-- Siparişler ile ilgili analizde aşağıdaki alt başlıklarda neden analiz yaptım şu şekilde açıklayabilirim;
-- Analizleri yaparken amacım Optimizasyon ve Karar Destek idi.

-- Müşteri memnuniyetini en üst düzeye çıkarmak ve iş süreçlerini 
-- optimize etmek adına sürekli olarak verileri analiz etmekteyiz ve bu analizlerden 
-- elde edilen bilgiler doğrultusunda ilgili birimler tarafından da stratejiler geliştirilmektedir.
-- Bu nedenle aşağıda yaptığım analizlerin neden önemli olduğunu şu şekilde açıklayabilirim.

-- 1. İade ve İptal Oranlarının Analizi:
-- İlk olarak, müşteri memnuniyetini artırmak ve iş süreçlerini iyileştirmek için 
-- iade ve iptal oranlarını incelemek doğru bir yol olur diye düşündüm. 
-- İade ve iptal oranlarının yüksek olması, müşteri memnuniyetini düşürebilir ve 
-- operasyonel maliyetleri artırabilir. 
-- Bu nedenle, bu oranları düşük tutmak için stratejiler geliştirmek gerekebilir.

-- 2. Ürün Kategorisi Kırılımında Sipariş Sayıları Analizi:
-- Ürün kategorilerine göre sipariş sayılarını analiz etmek, hangi ürünlerin daha 
-- popüler olduğunu ve talebin nasıl değiştiğini anlamamıza yardımcı olur. 
-- Bu bilgi, stok yönetimi ve pazarlama stratejileri açısından son derece değerlidir.

-- 3. Belirli Günlerdeki Sipariş Yoğunluğu Analizi:
-- Belirli günlerdeki sipariş yoğunluğunu analiz etmek, talep dalgalanmalarını öngörmemize 
-- ve operasyonel süreçleri buna göre ayarlamamıza yardımcı olur. 
-- Örneğin, tatil dönemlerinde veya özel indirim günlerinde sipariş yoğunluğu önceden 
-- tahmin edilerek stok ve personel planlaması daha etkin hale getirilebilir.

-- 4. Toplam Sipariş Miktarı Analizi:
-- Toplam sipariş miktarını analiz etmek, iş hacmimizi anlamamıza ve gelecekteki talebi 
-- tahmin etmemize yardımcı olur. 
-- Bu analiz, talep tahmin modelleri oluşturmak ve operasyonel kapasitemizi optimize etmek 
-- için temel bir bilgi sağlar.

-- 5. Yıllara Göre Aylık Sipariş Miktarları Analizi:
-- Yıllara göre aylık sipariş miktarlarını analiz etmek, mevsimsel trendleri ve 
-- iş performansımızdaki değişiklikleri belirlememize yardımcı olur. 
-- Bu bilgi, pazarlama ve stok yönetimi stratejilerimizi ayarlamamıza olanak tanır.

-- 6. Daha Fazla Kategoriye Ait Ürün Satışı Yapan Satıcılar ile İlgili Analiz:
-- Son olarak, daha fazla kategoriye ait ürün satışı yapan satıcıları analiz etmek, 
-- iş ortaklarımızın performansını değerlendirmemize ve hangi satıcılarla daha fazla 
-- iş yapmamız gerektiğine karar vermemize yardımcı olur.

-- Kısacası yaptığım bu analizlerin hepsi, iş süreçlerini iyileştirmek, 
-- operasyonel maliyetleri azaltmak ve müşteri memnuniyetini artırmak için oldukça önemlidir. 
-- Veri odaklı bir yaklaşım ile analizler yaparak, sürekli olarak 
-- gelişim göstermeyi ve rekabet avantajı elde etmeyi amaçlamaktayım.


-- 1) İade Edilen veya İptal Edilen Siparişlerin Yüzdesi ile İlgili Analiz:

-- Bu sorgu, siparişlerle ilgili çeşitli istatistikleri hesaplar.

-- cancelled_orders: İptal edilen siparişlerin sayısını hesaplar. 
-- shipped_date alanı boş ise, yani sipariş henüz gönderilmemişse, bu durum bir iptal olarak 
-- kabul edilir.

-- delayed_orders: Gecikmiş siparişlerin sayısını hesaplar. shipped_date alanı, required_date 
-- alanından sonra bir tarihi gösteriyorsa, bu durum bir gecikme olarak kabul edilir.

-- completed_orders: Tamamlanan siparişlerin sayısını hesaplar. Yani, shipped_date alanı 
-- boş değilse, yani sipariş gönderilmişse, bu durum tamamlanmış bir sipariş olarak kabul edilir.

-- total_orders: Toplam sipariş sayısını hesaplar.

-- cancellation_rate: İptal oranını yüzde cinsinden hesaplar. İptal edilen siparişlerin 
-- toplam siparişlere oranını gösterir. Bu oranı hesaplamak için iptal edilen siparişlerin 
-- sayısını toplam sipariş sayısına böleriz ve sonucu yüzde cinsinden ifade ederiz.

-- delay_rate: Gecikme oranını yüzde cinsinden hesaplar. Gecikmiş siparişlerin toplam siparişlere 
-- oranını gösterir. Bu oranı hesaplamak için gecikmiş siparişlerin sayısını toplam sipariş 
-- sayısına böleriz ve sonucu yüzde cinsinden ifade ederiz.

-- Bu sorgu, siparişlerin işlenme süreciyle ilgili çeşitli istatistikleri sağlar ve işletmenin sipariş 
-- performansını değerlendirmesine yardımcı olur.
SELECT 
    COUNT(CASE WHEN o.shipped_date IS NULL THEN 1 END) AS cancelled_orders,
    COUNT(CASE WHEN o.shipped_date IS NOT NULL AND o.shipped_date > o.required_date THEN 1 END) AS delayed_orders,
    COUNT(CASE WHEN o.shipped_date IS NOT NULL THEN 1 END) AS completed_orders,
    COUNT(order_id) AS total_orders,
    ROUND((COUNT(CASE WHEN o.shipped_date IS NULL THEN 1 END)::numeric / COUNT(order_id) * 100), 2) AS cancellation_rate,
    ROUND((COUNT(CASE WHEN o.shipped_date IS NOT NULL AND o.shipped_date > o.required_date THEN 1 END)::numeric / COUNT(order_id) * 100), 2) AS delay_rate
FROM 
    orders o;
	

-- 2) Ürün Kategorisi Kırılımında Sipariş Sayıları Analizi:
SELECT
    c.category_name,
    COUNT(DISTINCT o.order_id) AS siparis_sayisi
FROM 
    orders AS o
INNER JOIN 
    order_details AS od ON o.order_id = od.order_id
INNER JOIN 
    products AS p ON od.product_id = p.product_id
INNER JOIN 
    categories AS c ON p.category_id = c.category_id
GROUP BY 
    c.category_name
ORDER BY 
    siparis_sayisi DESC;
	
	
-- 3) Belirli Günlerdeki Sipariş Yoğunluğu Analizi:

-- EXTRACT(DOW FROM order_date) ifadesi haftanın günlerini 0'dan 6'ya kadar bir sayıya dönüştürür,
-- Pazar günü 0 olarak temsil edilir ve Cumartesi günü 6 olarak temsil edilir. 
-- Dolayısıyla, 1'den 5'e kadar olan sonuçlar aslında Pazartesi'den Cuma'ya kadar olan günleri 
-- temsil etmektedir. 

-- Çıktı da cumartesi (6) ve pazar (0) günlerinde sipariş bulunmamaktadır. Sonuçlar 1'den 5'e kadar
-- yani pazartesiden cumaya.
-- Cumartesi ve Pazar günlerinde sipariş olmaması farklı faktörlere bağlı olabilir ve 
-- işletmenin çalışma koşullarına veya pazar dinamiklerine göre farklı şekillerde yorumlanabilr. 
-- Örneğin;

-- Hafta Sonu Tatili: Cumartesi ve Pazar günleri, birçok işletmenin hafta sonu tatili olabilir. 
-- Dolayısıyla, bu günlerde siparişlerin az olması normal olabilir.

-- Tüketici Alışkanlıkları: Bazı sektörlerde, tüketicilerin hafta sonu daha az alışveriş yapma 
-- eğilimleri olabilir. Bu durum, ürün veya hizmetinizin tüketicilerin hafta sonu alışveriş yapma
-- alışkanlıklarına uygun olmadığı anlamına gelebilir.

-- Online Alışveriş Davranışları: Online alışverişte, hafta içi iş günlerine kıyasla hafta sonları
-- daha az trafiğin olması yaygındır. Bu durum, tüketicilerin hafta içi daha meşgul oldukları ve 
-- hafta sonlarını dinlenme veya diğer aktiviteler için ayırdıkları anlamına gelebilir.

-- Pazarlama ve Promosyonlar: İşletmenin hafta sonları için özel pazarlama veya promosyon 
-- stratejileri olmadığı durumlarda, siparişlerin az olması beklenen bir durumdur. 
-- Hafta sonlarına özel indirimler veya kampanyalar düzenleyerek bu durumu değiştirmek mümkündür.

-- Sezonluk Değişiklikler: Belirli mevsimlerde veya tatil dönemlerinde, 
-- tüketicilerin alışveriş alışkanlıkları değişebilir. Bu nedenle, özellikle tatil sezonlarında 
-- veya yaz aylarında, hafta sonu siparişlerinin artması veya azalması beklenen bir durum olabilir.

-- Bu faktörlerden herhangi biri veya birkaçı, işletmeniin hafta sonları siparişlerinin 
-- az olmasını yada hiç olmamasını açıklayabilir. 
-- Bu nedenle, işletmenin sektörüne, hedef kitlesine ve pazar koşullarına göre durumu 
-- değerlendirmek oldukça önemlidir. 
SELECT 
    EXTRACT(DOW FROM order_date) AS day_of_week,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY day_of_week
ORDER BY day_of_week


-- 4) Toplam Sipariş Miktarı Analizi: 
SELECT COUNT(*) AS total_orders
FROM orders;

-- 4.a) 1996/1997/1998 Yıllarına Ait Aylık Olarak Sipariş Miktarları(Order Dağılımı) Analizi:
SELECT 
    CONCAT(EXTRACT(YEAR FROM order_date), '-', LPAD(EXTRACT(MONTH FROM order_date)::text, 2, '0')) AS year_month,
    COUNT(order_id) AS order_count
FROM 
    orders
WHERE 
    EXTRACT(YEAR FROM order_date) IN (1996, 1997, 1998) AND order_date IS NOT NULL
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);
	
	
--5)Toplam Sipariş Tutarı Analizi:	
	SELECT ROUND(SUM(unit_price * quantity)::numeric, 2) AS total_order_amount
FROM order_details;

	
-- 6) Daha Fazla Kategoriye Ait Ürün Satışı Yapan Satıcılar ile İlgili Analiz: 
-- (Fazla kategoriye sahip satıcıların order sayıları da fazla mıdır?)
-- Çıktıyı incelediğimizde fazla kategoriye sahip satıcıların order sayıları da genel olarak
-- bakıldığında nispeten daha fazladır şeklinde bir yorum yapmak mümkündür.
-- (Not:ıktıyı ilk 10 satıcı ile sınırlandırdım.)
WITH SellerCategoryOrderCounts AS (
    SELECT
        s.supplier_id AS seller_id,
        s.city AS seller_city,
        COUNT(DISTINCT c.category_name) AS category_count,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM
        suppliers AS s
    LEFT JOIN
        products AS p ON s.supplier_id = p.supplier_id
    LEFT JOIN
        categories AS c ON p.category_id = c.category_id
    LEFT JOIN
        order_details AS od ON p.product_id = od.product_id
    LEFT JOIN
        orders AS o ON od.order_id = o.order_id
    GROUP BY
        s.supplier_id, s.city
)
SELECT
    seller_id,
    seller_city,
    category_count,
    order_count
FROM
    SellerCategoryOrderCounts
ORDER BY
    category_count DESC, order_count DESC
LIMIT 10;



-- ÜRÜN ANALİZİ --

-- Ürünler ile ilgili analizde aşağıdaki alt başlıklarda neden analiz yaptım şu şekilde açıklayabilirim;
-- Analizleri yaparken amacım Pazar Fırsatlarını ve Karlılığı İyileştirmek idi.

-- 1. En Çok Satılan Ürünler Analizi:
-- İlk olarak, en çok satılan ürünleri analiz etmedeki amacım bu analizin, 
-- hangi ürünlerin müşteriler tarafından en çok tercih edildiğini belirlemeye yardımcı olmasıdır. 
-- Bu bilgi, stok yönetimi, pazarlama stratejileri ve ürün portföyünü optimize etmek için 
-- son derece değerlidir. En çok satılan ürünleri belirlemek, talep eğilimlerini anlamak ve 
-- müşteri ihtiyaçlarına daha iyi cevap verebilmek için temel bir adımdır.

-- 2. En Karlı Ürünler Analizi:
-- En karlı ürünleri analiz etmek, yapılan işin karlılığını artırmak için kritik bir 
-- öneme sahiptir. Bu analiz, hangi ürünlerin en yüksek kar marjına sahip olduğunu belirlemeye ve 
-- kaynakların en verimli şekilde yönlendirilmesine yardımcı olur. 
-- Ayrıca, pazarlama stratejilerini ve fiyatlandırma politikalarını optimize etmek için de 
-- bu bilgileri kullanabiliriz.

-- 1) En Çok Satılan Ürünler ile ilgili Analiz:
SELECT 
    p.product_id, 
    p.product_name, 
    c.category_name,
    SUM(od.quantity) AS total_quantity
FROM 
    order_details od
JOIN 
    products p ON od.product_id = p.product_id
JOIN 
    categories c ON p.category_id = c.category_id
GROUP BY 
    p.product_id, 
    p.product_name,
    c.category_name
ORDER BY 
    total_quantity DESC
LIMIT 10;


-- 2) En Karlı Ürünler ile İlgili Analiz:
SELECT 
    p.product_id, 
    p.product_name, 
    c.category_name,
    ROUND(SUM(od.quantity * od.unit_price)::numeric, 2) AS total_revenue
FROM 
    order_details od
JOIN 
    products p ON od.product_id = p.product_id
JOIN 
    categories c ON p.category_id = c.category_id
GROUP BY 
    p.product_id, 
    p.product_name,
    c.category_name
ORDER BY 
    total_revenue DESC
LIMIT 10;


--3) Toplam Satılan Ürün Adedi Analizi:
SELECT COUNT(quantity) AS total_sold_products
FROM order_details;

--4) her bir Satıcının Sattığı Ürün Adedi:
SELECT e.employee_id, e.first_name, e.last_name, COUNT(od.quantity) AS total_sold_products
FROM employees e
INNER JOIN orders o ON e.employee_id = o.employee_id
INNER JOIN order_details od ON o.order_id = od.order_id
GROUP BY e.employee_id, e.first_name, e.last_name;


--5) Her Bir Kategoride Satılan Ürün Adedi:
SELECT 
    c.category_id, 
    c.category_name,
    COUNT(od.quantity) AS total_sold_products
FROM 
    categories c
INNER JOIN 
    products p ON c.category_id = p.category_id
INNER JOIN 
    order_details od ON p.product_id = od.product_id
GROUP BY 
    c.category_id, c.category_name;


--6) Ülke Bazlı Satılan Ürün Adedi:
SELECT 
    co.country_name,
    COUNT(od.quantity) AS total_sold_products
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
JOIN 
    countries co ON c.country_id = co.country_id
JOIN 
    order_details od ON o.order_id = od.order_id
GROUP BY 
    co.country_name;



-- TEDARİKÇİ ANALİZİ --

-- 1) Her Tedarikçinin Hangi Kategoride Ürün Sağladığını Bulma ile İlgili Analiz:

-- Elde edilen çıktı şu şekilde yorumlanabilir;

-- Kategori Çeşitliliği: Hangi kategorilerde hangi tedarikçilerin güçlü olduğunu belirlemek, 
-- işletmenin tedarik zincirinin çeşitliliğini ve rekabet gücünü değerlendirmek için önemlidir. 
-- Örneğin, bir kategoride yalnızca birkaç tedarikçiyle çalışmak, işletmeyi tedarikçi riskine 
-- karşı savunmasız bırakabilir.

-- Stratejik İlişkilerin Belirlenmesi: Hangi tedarikçilerin hangi kategorilerde güçlü olduğunu 
-- belirlemek, stratejik tedarikçi ilişkilerinin oluşturulmasına yardımcı olabilir. 
-- Örneğin, belirli bir kategoride güçlü olan bir tedarikçiyle daha yakın işbirliği yapmak, 
-- rekabet avantajı sağlayabilir veya maliyetleri azaltabilir.

-- Bu analiz, işletmenin tedarik zincirinin güçlü ve zayıf yönlerini belirlemek ve 
-- tedarik süreçlerini optimize etmek için değerli bir giriş sağlar. 
-- Tedarikçilerle olan ilişkilerin yönetilmesi, maliyetlerin azaltılması ve rekabet avantajının 
-- artırılması gibi stratejik kararlar almak için bu tür bir analize dayalı bilgi önemlidir.
SELECT 
    s.supplier_id,
    s.company_name,
    c.category_name
FROM 
    suppliers s
LEFT JOIN 
    products p ON s.supplier_id = p.supplier_id
LEFT JOIN 
    categories c ON p.category_id = c.category_id
ORDER BY 
    s.supplier_id;
	
	

-- CİRO ANALİZİ --

-- 1) Kategori Bazında Toplam Ciro Analizi: PYTHONDA GÖRSELLEŞTİRDİM
-- Bu analizde, her bir kategorinin toplam ciro katkısını bulabiliriz.

-- Altta ürün bazlı analizdeki yorumların aynısı kategori bazlı analiz içinde geçerlidir.

SELECT c.category_id, c.category_name, 
       CAST(SUM(od.quantity * od.unit_price) AS NUMERIC(10,2)) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_sales DESC;


-- 2) Ürün Bazında Toplam Ciro Analizi:
-- Bu analizde, her bir ürünün toplam ciro katkısını bulabiliriz.

-- Ürün bazında yapılan toplam ciro analizi, işletmenin farklı ürünlerinin 
-- satış performansını değerlendirmek için önemli bir araçtır. Bu analizden elde edilen 
-- çıktıları yorumlamak ve değerlendirmek için aşağıdaki noktalara dikkat edebiliriz:

-- Karlılık Analizi: Hangi ürünlerin işletmeye daha fazla kar getirdiğini belirlemek 
-- için çıktılara bakabiliriz. Yüksek ciroya sahip ürünlerin, işletme için 
-- daha karlı olup olmadığını değerlendirebiliriz.

-- Ürün Popülerliği: Hangi ürünlerin müşteriler tarafından daha fazla talep gördüğünü 
-- belirlemek için çıktılara bakabiliriz. Bu, hangi ürünlerin popüler olduğunu ve 
-- müşteri tercihlerini anlamamıza yardımcı olur.

-- Ürün Portföyü Yönetimi: Hangi ürünlerin daha fazla satıldığını ve daha fazla ciro 
-- elde ettiğini belirleyerek ürün portföyü yönetimini iyileştirebiliriz. 
-- Yavaş hareket eden ürünleri değerlendirerek, stok seviyelerini ve yenileme stratejilerini 
-- bu bilgilere göre ayarlayabiliriz.

-- Pazarlama Stratejileri: Hangi ürünlerin daha fazla gelir getirdiğini belirleyerek 
-- pazarlama stratejilerini yönlendirebiliriz. Yüksek ciroya sahip ürünler için özel pazarlama 
-- kampanyaları düzenleyebiliriz veya bu ürünleri vurgulayabiliriz.

-- Ürün Geliştirme: Hangi ürünlerin daha fazla potansiyele sahip olduğunu belirleyerek 
-- ürün geliştirme stratejilerini belirleyebiliriz. Yüksek ciroya sahip ürünlerde yenilikler 
-- ve iyileştirmeler yaparak, müşteri talebini daha iyi karşılayabiliriz.

-- Rekabet Analizi: Hangi ürünlerin daha rekabetçi olduğunu belirlemek için 
-- rakip analizi yapabiliriz. Rakiplerimizin hangi ürünlerde daha fazla ciroya 
-- sahip olduğunu belirleyerek, rekabet stratejilerini geliştirebiliriz.

-- Bu gibi analizler, işletmenin ürün performansını anlamak, pazarlama stratejilerini 
-- optimize etmek ve karar almak için önemli bilgiler sağlar.
SELECT p.product_id, p.product_name, 
       ROUND(SUM(od.quantity * od.unit_price)::numeric, 2) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;


-- 3) Genel Toplam Ciro Analizi: 
SELECT
    ROUND(SUM(od.quantity * od.unit_price)::numeric, 2) AS total_revenue
FROM
    orders o
INNER JOIN
    order_details od ON o.order_id = od.order_id;


	
-- REGİON ANALİZİ --

-- Region ile ilgili analizde aşağıdaki alt başlıklarda neden analiz yaptım şu şekilde açıklayabilirim;
-- Analizleri yaparken amacım Pazarın Coğrafi Dinamiklerini Anlamak ve Stratejik Kararlar Almak idi.

-- 1. Her Bölgedeki Toplam Satış Tutarı ve Sipariş Sayısı Analizi:
-- Her bölgedeki toplam satış tutarlarını analiz ediyoruz çünkü bu analiz, 
-- coğrafi bölgelerdeki pazar büyüklüğünü ve potansiyelini anlamamıza yardımcı olur. 
-- Hangi bölgelerde daha fazla satış yapıldığını ve hangi bölgelerde potansiyel bir 
-- büyüme fırsatı olduğunu belirlememize olanak tanır. 
-- Bu bilgi, pazarlama stratejilerimizi ve satış hedeflerimizi belirlemede kritik bir rol oynar.
-- Aynı zamanda bu ek olarak aynı sorgu içerisinde her bölgedeki sipariş sayılarını analiz etmek, coğrafi bölgelerdeki müşteri taleplerini 
-- anlamamıza ve siparişlerin dağılımını görmemize yardımcı olur. 
-- Bu analiz, lojistik ve stok yönetimi süreçlerimizi optimize etmemize ve müşteri memnuniyetini 
-- artırmamıza olanak tanır. Ayrıca, bölgesel talep eğilimlerini belirleyerek pazarlama 
-- stratejilerimizi daha etkin hale getirebiliriz.

-- 2. Bölge Bazlı Her Kategorideki Sipariş Sayısı Analizi:
-- Son olarak, bölge bazında her kategorideki sipariş sayılarını analiz ediyoruz çünkü bu analiz,
-- hangi ürünlerin hangi bölgelerde daha popüler olduğunu ve talep eğilimlerini belirlememize 
-- yardımcı olur. Bu bilgi, stok yönetimi, pazarlama stratejileri ve ürün portföyümüzü 
-- optimize etmek için kritik öneme sahiptir. Ayrıca, bölgesel pazarlarda büyüme fırsatlarını 
-- belirlememize ve bu pazarlarda rekabet avantajı elde etmemize olanak tanır.


-- 1) Her Bölgedeki Toplam Satış Tutarı ve Sipariş Sayısı Analizi:
SELECT r.region_description,
       COUNT(o.order_id) AS total_orders,
       ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS total_sales
FROM region r
JOIN territories t ON r.region_id = t.region_id
JOIN employeeterritories e ON t.territory_id = e.territory_id
JOIN orders o ON e.employee_id = o.employee_id
LEFT JOIN order_details od ON o.order_id = od.order_id
GROUP BY r.region_description
ORDER BY total_sales DESC;


-- 2) Bölge Bazlı Her Kategorideki Sipariş Sayısı Analizi:

-- Bölge bazlı her kategorideki sipariş sayısını bulmak, 
-- işletmenin farklı bölgelerdeki ürün talebini anlamasına ve iş stratejilerini 
-- geliştirmesine yardımcı olabilir. Bu analizden elde edilebilecek bazı sonuçlar ve 
-- yorumlar şunlar olabilir:

-- Talep Trendleri: Farklı bölgelerdeki kategori bazında sipariş sayıları incelenerek, 
-- belirli ürün kategorilerinin hangi bölgelerde daha popüler olduğu belirlenebilir. 
-- Örneğin, bir bölgede teknoloji ürünlerine olan talep diğer bölgelere göre daha yüksek olabilir.

-- Pazar Fırsatları: Belirli bir bölgede belirli bir ürün kategorisine olan talebin diğer 
-- bölgelere göre daha düşük olması, bu kategorideki pazar fırsatlarını gösterebilir. 
-- İşletme, bu bölgelerde pazar payını artırmak için stratejiler geliştirebilir veya 
-- yeni ürünler sunabilir.

-- Stok Yönetimi: Analiz, bölge bazında talep tahminlerine dayanarak stok yönetimini ,
-- optimize etmeye yardımcı olabilir. Talebin yoğun olduğu bölgelerde 
-- stok miktarı artırılabilirken, talebin düşük olduğu bölgelerde stok miktarı azaltılabilir.

-- Pazarlama ve Satış Stratejileri: Bölge bazında talep analizi, pazarlama ve 
-- satış stratejilerinin belirlenmesine yardımcı olabilir. Örneğin, belirli bir bölgede 
-- belirli bir ürün kategorisine olan talebi artırmak için hedefli pazarlama kampanyaları 
-- oluşturulabilir veya satış ekipleri bu bölgelerde daha fazla çaba gösterebilir.

-- Rekabet Analizi: Rakip işletmelerin hangi bölgelerde hangi ürün kategorilerinde güçlü olduğunu 
-- anlamak için bölge bazlı sipariş analizi yapılabilir. Bu bilgi, işletmenin 
-- rekabet stratejilerini belirlemesine ve rekabet avantajları oluşturmasına yardımcı olabilir.

-- Bu gibi yorumlar, işletmenin pazarı daha iyi anlamasına ve stratejik kararlar almasına 
-- yardımcı olabilir. Ancak, herhangi bir analizin doğru şekilde yorumlanabilmesi için 
-- diğer faktörlerin de dikkate alınması önemlidir.
SELECT r.region_description, c.category_name, COUNT(o.order_id) AS total_orders
FROM region r
JOIN territories t ON r.region_id = t.region_id
JOIN employeeterritories e ON t.territory_id = e.territory_id
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY r.region_description, c.category_name;



-- SATIŞ ANALİZİ --

-- 1) Her Yılın Her Ayının Toplam Satış Miktarı ve Ciro Analizi:

-- Her yılın her ayının toplam satış miktarını ve cirosunu gösteren bir sorgu çıktısı, 
-- işletmenin aylara göre satış performansını analiz etmek için değerli bir kaynaktır. 
-- Bu verilere dayanarak yapılabilecek bazı analizler ve yorumlar şunlar olabilir:

-- Sezonluk Trendler: Hangi ayların daha yüksek satış miktarına ve ciroya sahip olduğunu 
-- belirleyerek sezonluk trendleri analiz edebiliriz. Örneğin, tatil dönemleri veya 
-- özel etkinlikler gibi belirli zaman dilimlerinde satışlarda artış olabilir.

-- Pazarlama Etkinlikleri: Belirli pazarlama kampanyalarının veya promosyonların 
-- etkisini değerlendirmek için aylara göre satış miktarlarını inceleyebiliriz. 
-- Özellikle belirli aylarda yapılan pazarlama faaliyetlerinin satışlara nasıl etki ettiğini 
-- görebiliriz.

-- Stok Yönetimi: Hangi aylarda hangi ürünlerin daha fazla satıldığını belirleyerek 
-- stok yönetimini iyileştirebiliriz. Özellikle belirli aylarda talebin arttığı 
-- ürünleri stoklamak veya tedarik zincirini buna göre düzenlemek mümkün olabilir.

-- Müşteri Davranışları: Belirli aylarda müşteri davranışlarını analiz ederek 
-- müşteri taleplerini anlayabiliriz. Örneğin, belirli mevsimlerde veya 
-- tatil dönemlerinde müşterilerin hangi ürünleri tercih ettiğini ve satın aldığını görebiliriz.

-- Operasyonel Planlama: Aylara göre satış miktarlarını inceleyerek operasyonel planlamayı 
-- optimize edebiliriz. Özellikle belirli aylarda talebin arttığı veya azaldığı dönemleri 
-- önceden tahmin ederek kaynakları daha etkin bir şekilde yönetebiliriz.

-- Bu gibi analizler, işletmenin satış ve operasyonel performansını iyileştirmek, 
-- pazarlama stratejilerini yönlendirmek ve müşteri memnuniyetini artırmak için 
-- önemli bilgiler sağlar.
SELECT
    TO_CHAR(o.order_date, 'YYYY-MM') AS order_year_month,
    SUM(od.quantity) AS total_quantity,
    ROUND(SUM(od.quantity * od.unit_price)::numeric, 2) AS total_revenue
FROM
    orders o
INNER JOIN
    order_details od ON o.order_id = od.order_id
GROUP BY
    TO_CHAR(o.order_date, 'YYYY-MM')
ORDER BY
    order_year_month;


-- 2)  Her Bir Çalışanın Hangi Kategoride Kaç Ürün Sattığı Analizi: PYTHONDA GÖRSELLEŞTİRDİM.

-- Çalışanların hangi kategoride kaç ürün sattığını bulmak, işletmenin ürün performansını 
-- anlamak ve pazarlama stratejilerini geliştirmek için önemli bir adımdır. 
-- Bu bilgilerle ilgili olarak yapılabilecek bazı yorumlar şunlar olabilir:

-- Kategori Performansı: Hangi kategorilerin daha fazla satıldığını belirleyerek işletmenin 
-- kategori bazında performansını değerlendirebiliriz. Belirli kategorilerin diğerlerine göre 
-- daha popüler olması, stok yönetimini ve satış stratejilerini yeniden düzenlememize 
-- yardımcı olabilir.

-- Çalışan Performansı: Hangi çalışanların hangi kategorilerde daha fazla satış yaptığını 
-- belirleyerek çalışanların performansını değerlendirebiliriz. Bazı çalışanlar belirli 
-- kategorilerde daha başarılı olabilir ve bu bilgi, satış ekibinin eğitim ve yönlendirmesinde 
-- önemli bir rol oynayabilir.

-- Müşteri İlişkileri Yönetimi: Hangi müşterilere hangi kategorilerde ürünler satıldığını 
-- inceleyerek müşteri ilişkilerini geliştirebiliriz. Müşterilerin tercih ettiği kategorileri 
-- belirleyerek bu bilgilere dayalı olarak müşteriye özel pazarlama stratejileri geliştirebiliriz.

-- Ürün Yönetimi: Hangi ürünlerin hangi kategorilerde daha fazla satıldığını belirleyerek 
-- ürün yönetim stratejilerini geliştirebiliriz. Özellikle belirli kategorilerdeki ürünlerin 
-- stok seviyelerini ve yenileme stratejilerini bu bilgilere göre ayarlayabiliriz.

-- Pazarlama Stratejileri: Hangi kategorilerin daha fazla talep gördüğünü belirleyerek 
-- pazarlama stratejilerini yönlendirebiliriz. Özellikle belirli kategorilerdeki ürünlere 
-- odaklanarak pazarlama kampanyaları ve promosyonlar düzenleyebiliriz.

-- Bu gibi analizler, işletmenin satış ve pazarlama stratejilerini geliştirmek, 
-- ürün yönetimini iyileştirmek ve müşteri memnuniyetini artırmak için değerli bilgiler sağlar.
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
    e.title AS employee_title,
    c.category_name,
    SUM(od.quantity) AS total_quantity
FROM 
    employees e
LEFT JOIN 
    orders o ON e.employee_id = o.employee_id
LEFT JOIN 
    order_details od ON o.order_id = od.order_id
LEFT JOIN 
    products p ON od.product_id = p.product_id
LEFT JOIN 
    categories c ON p.category_id = c.category_id
GROUP BY 
    e.employee_id, e.first_name, e.last_name, c.category_name
ORDER BY 
    total_quantity DESC;


-- 3) Her Bir Çalışanın Aldığı Toplam Sipariş Miktarı ve Toplam Satış Tutarı Analizi:

-- Bu analiz sonucunda elde ettiğimiz çıktılar ile şu yorumları yapabiliriz;

-- Performans Değerlendirmesi: Çalışanların satış performansını değerlendirmek için 
-- bu verileri kullanabiliriz. Toplam sipariş miktarı ve toplam satış tutarı, 
-- hangi çalışanların daha fazla satış yaptığını ve performanslarının nasıl olduğunu 
-- anlamamıza yardımcı olur.

-- Ödül ve Teşvik Sistemi: Yüksek satış yapan çalışanları ödüllendirmek veya 
-- teşvik etmek için bu verileri kullanabiliriz. Örneğin, en fazla sipariş alan veya 
-- en yüksek satış tutarına ulaşan çalışanlara bonus veya özel teşvikler verilebilir.

-- Eğitim ve Geliştirme İhtiyaçları: Düşük satış yapma durumunda olan 
-- çalışanları belirleyerek eğitim veya geliştirme programlarına yönlendirebiliriz. 
-- Bu analiz, çalışanların güçlü ve zayıf yönlerini belirlememize yardımcı olabilir.

-- Müşteri İlişkileri Yönetimi: Hangi çalışanların hangi müşterilere daha fazla 
-- satış yaptığını inceleyerek müşteri ilişkileri yönetimine odaklanabiliriz. 
-- Belirli müşteri segmentlerine odaklanmak veya belirli müşterilerle daha fazla 
-- etkileşimde bulunmak için bu bilgileri kullanabiliriz.

-- Ürün Yönetimi: Hangi ürünlerin hangi çalışanlar tarafından daha çok satıldığını 
-- belirleyerek ürün yönetim stratejilerini geliştirebiliriz. Belirli ürünlerin satışını artırmak 
-- veya stok yönetimini iyileştirmek için bu analizlerden yararlanabiliriz.

-- Bu gibi analizler, işletmenin satış ve pazarlama stratejilerini geliştirmek, 
-- çalışan performansını artırmak ve müşteri memnuniyetini artırmak için değerli bilgiler sağlar.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
	   e.title AS employee_title,
       COUNT(o.order_id) AS total_orders,
       CAST(SUM(od.quantity * od.unit_price) AS NUMERIC(10,2)) AS total_sales
FROM employees e
LEFT JOIN orders o ON e.employee_id = o.employee_id
LEFT JOIN order_details od ON o.order_id = od.order_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_sales DESC;


-- 4) Çalışanların Satış Performansını Değerlendirerek, Satış Verileri Üzerinde Yapılan Analiz 

-- Son olarak bize verilen örnek sql sorgusunu da buraya ekleyip yorum yapmak istedim,

-- Bu sorgu, şirket içindeki çalışanların satış performansını değerlendirmek amacıyla kullanılır.
-- Çalışanların toplam satış miktarı, sipariş sayısı, satış giriş sayısı gibi metrikler üzerinde 
-- analiz yapar. Ayrıca, her bir çalışanın ortalama sipariş başına düşen satış miktarı, 
-- ortalama sipariş başına düşen satış miktarı gibi performans ölçütlerini hesaplar. 
-- Toplam indirim miktarı ve toplam satış tutarı arasındaki indirim yüzdesini de 
-- hesaplayarak çalışanların indirim politikaları üzerindeki etkisini değerlendirir. 
-- Bu analiz, şirketin satış performansını anlamak ve çalışanların katkılarını değerlendirmek
-- için kullanılır.
WITH cte_kpi AS (
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
	e.title AS employee_title,
	ROUND( SUM(d.quantity * d.unit_price)::NUMERIC, 2) AS total_sale_amount_excluding_discount,
    COUNT(DISTINCT d.order_id) AS total_number_orders,
    COUNT(d.*) AS total_number_entries, ROUND( SUM(d.discount*(d.quantity * d.unit_price))::NUMERIC, 2) AS total_discount_amount,
	ROUND( SUM((1 - d.discount)*(d.quantity * d.unit_price))::NUMERIC, 2) AS total_sale_amount_including_discount
FROM orders AS o
INNER JOIN employees AS e
ON o.employee_id = e.employee_id
INNER JOIN order_details AS d
ON d.order_id = o.order_id
INNER JOIN products AS p
ON d.product_id = p.product_id
GROUP BY 
	employee_full_name,
	employee_title
)
SELECT 
	employee_full_name,
	employee_title,
	total_sale_amount_excluding_discount,
	total_number_orders,
	total_number_entries,
	ROUND(
		SUM(total_sale_amount_excluding_discount/total_number_entries),
		   2) AS average_amount_per_entry,
	ROUND(
		SUM(total_sale_amount_excluding_discount/total_number_orders),
		   2) AS average_amount_per_order,
	total_discount_amount,
	total_sale_amount_including_discount,
	SUM(ROUND(
		(total_sale_amount_excluding_discount-total_sale_amount_including_discount)/total_sale_amount_excluding_discount*100,
		2)) AS total_discount_percentage
FROM cte_kpi
GROUP BY
	employee_full_name,
	employee_title,
	total_sale_amount_excluding_discount,
	total_number_orders,
	total_number_entries,
	total_sale_amount_including_discount,
	total_discount_amount
ORDER BY total_sale_amount_including_discount DESC;

