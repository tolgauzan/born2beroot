<div align="center">
  <!-- Logo -->
  <a href="https://github.com/tolgauzan/born2beroot">
  <img src="docs/born2berootm.png" alt="Logo" width="150" height="150">
  </a>
</div>

# Born2beRoot

Born2beRoot, 42 çekirdek müfredatından bir Sistem Yönetimi alıştırmasıdır. Yapılması gereken VirtualBox kullanarak katı kurallara uygun bir makine oluşturmaktır.
Bu anlatım Debian için projenin bonus ile kurulum talimatlarını içermektedir.

**Grade** : ?/100 \
**Subjects v3.2** : [`TR`](docs/tr.subject.pdf)

---
## 1- Sanal Makine (Virtual Machine)💿

Makinenizde ayrı bir ikincil işletim sistemi çalıştırmak için bir Sanal Makineye ihtiyacınız olacaktır. Bir sanal makine (VM), fiziksel bir bilgisayar üzerinde sanal bir bilgisayar çalıştıran bir yazılım çözümüdür. Gerçek bir bilgisayar gibi işlev görür ancak fiziksel donanımdan izole edilmiştir. Sanal makineler, bir hipervizör tarafından yönetilen sanal bir donanıma (CPU, bellek, depolama gibi) sahiptir.

**Sanal Makine (VM) Kullanmanın Avantajları ve Dezavantajları**

| **Avantajlar**                                       | **Dezavantajlar**                                    |
|------------------------------------------------------|------------------------------------------------------|
| **1. Kaynak İzolasyonu ve Güvenlik**                 | **1. Performans Kaybı**                              |
| - Her sanal makine, ana işletim sisteminden izole edilmiştir. Bu, güvenlik risklerini azaltır. | - Sanal makineler, fiziksel donanım üzerinde çalıştıkları için performans kaybına neden olabilir. |
|                                                      |                                                      |
| **2. Test ve Geliştirme Ortamları**                  | **2. Donanım Kaynaklarının Paylaşılması**           |
| - Yeni yazılımları ve güncellemeleri ana sisteminize zarar vermeden test edebilirsiniz. | - Sanal makineler, işlemci, bellek ve disk gibi kaynakları paylaşır; bu da aşırı yüklenmelere yol açabilir. |
|                                                      |                                                      |
| **3. Maliyet Verimliliği**                           | **3. Yönetim Karmaşıklığı**                          |
| - Fiziksel donanım satın almak yerine sanal makineler oluşturmak daha düşük maliyetli olabilir. | - Birden fazla sanal makineyi yönetmek karmaşık hale gelebilir, ek araçlar gerekebilir. |
|                                                      |                                                      |
| **4. Taşınabilirlik**                                | **4. Ekstra Yazılım Gereksinimleri**                 |
| - Sanal makinelerin imajları kolayca taşınabilir ve bir sistemden diğerine aktarılabilir. | - Her sanal makine için hipervizör ve ek yazılımlar gereklidir, bu da sistemde yer kaplar. |
|                                                      |                                                      |
| **5. Yedekleme ve Kurtarma Kolaylığı**               | **5. Güvenlik Riskleri**                             |
| - Sanal makinelerin yedeği hızlıca alınabilir ve geri yüklenmesi de oldukça basittir. | - Hipervizör ve sanal makineler, güvenlik açıklarına sahip olabilir. Bir güvenlik açığı, tüm sanal makineleri etkileyebilir. |
|                                                      |                                                      |
| **6. Farklı İşletim Sistemlerini Paralel Çalıştırma**| **6. Depolama ve Disk Alanı İhtiyacı**               |
| - Aynı anda birden fazla işletim sistemi çalıştırılabilir, bu da çoklu platform yazılım geliştirme için idealdir. | - Sanal makineler, her biri için bir disk imajı oluşturduğundan, büyük depolama alanı gereksinimi doğurur. |
|                                                      |                                                      |


### 1.1 - Sanallaştırma (Virtualization)
Sanallaştırma, fiziksel bir donanım üzerinde birden fazla sanal makine çalıştırılmasını mümkün kılan bir teknolojidir. Bu teknoloji, hipervizörler adı verilen yazılımlar aracılığıyla uygulanır. Hipervizör, fiziksel donanım ile sanal makineler arasında bir köprü görevi görerek kaynakların verimli bir şekilde paylaşılmasını sağlar. Bu sayede her sanal makine, kendi işletim sistemi ve uygulamalarıyla bağımsız bir şekilde çalışabilir.

- Sanal Makine Yöneticisi (VMM): Bu yazılım, sanal makinelerin oluşturulmasını ve yönetilmesini sağlar. VMM, her bir sanal makineye gerekli kaynakları (işlemci, bellek, depolama) tahsis eder ve sanal makinelerin durumunu izler. Örneğin, VirtualBox Tip-2 hipervizörüdür.

### 1.2 - Hipervizör Türleri (Hypervisor Types)

**Hipervizörler iki ana türe ayrılır:**

- **Tip-1 (Bare-Metal) Hipervizörler:** Bu hipervizörler, doğrudan fiziksel donanım üzerinde çalışır ve bir işletim sistemi kullanmazlar. Donanımla doğrudan iletişim kurarak sanal makinelerin yönetimini sağlarlar. Hyper-V, ESXi gibi örnekler Tip-1 hipervizörleridir ve genellikle yüksek performans gerektiren ortamlar için uygundur.

- **Tip-2 (Hosted Hypervisor) Hipervizörler:** Bu hipervizörler, bir ana işletim sistemi üzerinde çalışır ve donanım ile sanal makineler arasındaki bağlantıyı ana işletim sistemi üzerinden kurar. VirtualBox, VMware Fusion, ve Parallels gibi örnekler Tip-2 hipervizörleridir. Tip-2 hipervizörler, genellikle kişisel kullanıcılar ve küçük ölçekli sanalizasyon ortamları için uygundur.

- **Tip-1 vs Tip-2 Hipervizörler:** Tip-1 hipervizörler daha yüksek performans sağlar çünkü doğrudan donanımla iletişim kurar. Tip-2 hipervizörlerde ise ana işletim sistemi üzerinden geçiş yapıldığı için gecikmeler yaşanabilir. Ayrıca, Tip-2 hipervizörler, ana işletim sisteminin güvenliğinden bağımsız olarak ek güvenlik risklerine yol açabilir.

### 1.3 - VDI Dosyaları (Virtual Disk Image)
VDI (Virtual Disk Image), sanal bir sabit disk dosyasıdır ve bir sanal makinenin depolama ortamını temsil eder. VirtualBox gibi hipervizörlerde, yeni bir sanal makine oluşturduğunuzda bir VDI dosyası oluşturulur. Bu dosya, sanal makinenin çalıştığı sırada fiziksel bir sabit disk gibi davranır, böylece sanal makine, üzerinde çalışan konuk işletim sistemini gerçek bir sabit disk gibi kullanabilir.

### 1.4 - Debian Linux OS
Debian, kullanıcı dostu, açık kaynaklı bir Linux dağıtımıdır. Debian, 120'den fazla farklı modelde kullanılabilen bir temel dağıtımdır. Debian, GNOME gibi masaüstü ortamları sunar ve genellikle kararlılığı ile bilinir. Debian, üç ana kanal sunar:

- Stable (Kararlı): Yüksek güvenlik ve minimum hata oranı sağlar.
- Testing (Geliştirme): Geliştirme aşamasındaki paketler içerir.
- Unstable (İstikrarsız): En son özellikleri ve paketleri içerir, ancak daha fazla hata içerebilir

### 1.5 - Rocky Linux OS
Rocky Linux, Red Hat Enterprise Linux (RHEL) uyumlu, açık kaynaklı bir Linux dağıtımıdır. RHEL sistemlerine benzer bir deneyim sunar ve genellikle maliyet açısından daha uygun bir alternatiftir. Rocky Linux, DNF (Dandified YUM) paket yöneticisini kullanır. DNF, yazılım paketlerini kolayca yönetmek için kullanılan modern bir araçtır ve RHEL tabanlı sistemlerle uyumlu çalışır.

**Rocky Linux'un Paket Yönetimi:**

- Paketler **dnf** (Dandified YUM) ile yönetilir. DNF, RHEL ve CentOS sistemleri ile uyumludur ve daha hızlı, daha güvenilir bir paket yönetim deneyimi sağlar.
- Paket kurulumları, kaldırılmaları ve güncellemeleri ```dnf install```, ```dnf remove```, ```dnf update``` vb gibi komutlarla yapılır.

Rocky Linux, güvenlik güncellemeleri, sistem yönetimi ve kurulum işlemleri açısından RHEL ile aynı seviyede deneyim sağlar, ancak tamamen açık kaynaklıdır ve topluluk tarafından desteklenir.

---

## 2- Linux Güvenlik Modülleri(LSM) ve Güvenlik Yöntemleri
**Linux Güvenlik Modülü (LSM)** ve bu modüllerin sanal makinelerde nasıl çalıştığına dair açıklamalar içermektedir. Ayrıca, **SELinux** ve **AppArmor** güvenlik modüllerinin karşılaştırmalarını ve her iki sistemin özelliklerini ele alacaktır.

### 2.1 - Linux Güvenlik Modülü (LSM) 🛠
**Linux Güvenlik Modülü (LSM)**, Linux çekirdeğinin güvenliği artırmak için kullandığı bir çerçevedir ve farklı güvenlik modüllerini destekler. LSM, **Zorunlu Erişim Kontrolü (MAC)** uygulayarak sistemin kaynaklarına erişimi düzenler. MAC, süreçlerin ve kullanıcıların dosyalar, dizinler, soketler, portlar ve cihazlar gibi kaynaklara nasıl erişebileceğini belirleyen ve zorunlu kılan bir politikadır. Bu politika, **İstekli Erişim Kontrolü (DAC)**'dan farklıdır çünkü MAC, erişimi belirli kurallar ve politikalara dayalı olarak sınırlayarak güvenliği artırır.

**LSM'nin Sanal Makinelerdeki Rolü**

LSM, sanal makinelerde ek bir güvenlik katmanı sağlar. Hipervizörlerle birlikte çalışarak sanal makineler arasındaki izolasyonu güçlendirir ve bir sanal makinedeki kötü niyetli etkinliklerin diğerlerine ya da ana makineye zarar vermesini engeller. Bu, sanal ortamların güvenliğini artırarak potansiyel saldırılara karşı koruma sağlar.

LSM, hipervizöre entegre edilebilir ve tüm sanal makinelerde merkezi bir politika yönetimi sağlar. Alternatif olarak, her sanal makinede ayrı ayrı uygulanabilir. Bu esneklik, güvenlik yönetimini daha verimli hale getirir.

### 2.2 - SELinux (Security-Enhanced Linux)

**SELinux (Security-Enhanced Linux)**, Linux için geliştirilmiş bir güvenlik modülüdür. SELinux, sistemdeki süreçler ve kaynaklara güvenlik etiketleri atar. Her nesnenin ve sürecin güvenlik bağlamı belirlenir ve SELinux, bu bağlamları tanımlı politikalarla karşılaştırarak, erişim taleplerine karar verir.

### SELinux'un Çalışma Prensibi:
- **Güvenlik Bağlamları**: Her sistem nesnesine (dosya, port, süreç vb.) bir güvenlik etiketi atanır. Bu etiket, nesnenin rolünü, izinlerini ve kaynağını tanımlar.
- **Politikalar**: SELinux, güvenlik etiketlerine göre belirli kurallara dayalı olarak, nesneler arasındaki etkileşimi yönetir.
- **Esneklik ve Güçlülük**: SELinux, etiketler, güvenlik bağlamları, politikalar ve modlarla güçlü bir güvenlik modeli sunar. Ancak bu esneklik, yapılandırma ve yönetim açısından karmaşık olabilir.

**SELinux'un Avantajları:**
- **Yüksek Güvenlik**: Kapsamlı erişim kontrolü sağlar.
- **Esneklik**: Güvenlik politikalarını genişletilebilir ve özelleştirilebilir.
- **Kontrol**: Sistemdeki tüm etkileşimler üzerinde tam kontrol sağlar.


### 2.3 - AppArmor (Application Armor)

**AppArmor** (Application Armor), her bir uygulama için profil tanımlar. Bu profiller, uygulamaların hangi dosyalar, dizinler, soketler, portlar ve cihazlara erişebileceğini belirler. AppArmor, **yol tabanlı** (path-based) bir güvenlik modeline dayanır, yani her uygulamanın hangi dosya yollarına erişebileceği tanımlanır.

**AppArmor'un Çalışma Prensibi:**
- **Profil Tabanlı Erişim Kontrolü**: Uygulama için belirlenen profiller, ona hangi kaynaklara erişebileceği hakkında bilgi verir.
- **Yol Tabanlı Yapı**: AppArmor, belirli yollarla (dosya yolları) erişim kontrolü yapar.
- **Kullanıcı Dostu**: SELinux'a göre daha basit ve anlaşılır bir yapıya sahiptir. Profiller daha kolay oluşturulabilir ve yönetilebilir.

AppArmor'un durumu, ```aa-status``` ile kontrol edilebilir

**AppArmor'un Avantajları:**
- **Basitlik**: Profiller yol tabanlı olduğundan daha sezgisel bir kullanım sunar.
- **Kullanıcı Dostu**: SELinux'a kıyasla daha kolay öğrenilebilir ve yönetilebilir.
- **Esneklik**: Kapsamlı bir yapı sunar, ancak SELinux kadar karmaşık değildir


### 2.4 - SELinux ve AppArmor Karşılaştırması

**SELinux** ve **AppArmor** güvenlik modüllerinin karşılaştırması

| Özellik                   | **SELinux**                                         | **AppArmor**                                      |
|---------------------------|-----------------------------------------------------|--------------------------------------------------|
| **Güvenlik Modeli**        | Etiket tabanlı ve karmaşık güvenlik politikaları    | Yol tabanlı, basit güvenlik profilleri            |
| **Karmaşıklık**            | Daha karmaşık ve esnek, öğrenilmesi zordur         | Daha basit ve kullanıcı dostudur                  |
| **Yönetim**                | Yüksek esneklik, ancak yönetimi karmaşıktır         | Yönetimi kolay, ancak esneklik SELinux'a kıyasla daha sınırlıdır |
| **Erişim Kontrolü**        | Detaylı etiketler ve kurallar kullanılır           | Yol tabanlı profillerle belirlenir                |
| **Kullanıcı Dostu**        | Daha karmaşık, daha fazla öğrenme gerektirir       | Basit ve sezgisel, yönetimi daha kolaydır         |

**SELinux**, daha güçlü ve esnek bir güvenlik modeli sunar, ancak yönetimi ve yapılandırması daha zordur.

**AppArmor**, daha kullanıcı dostu ve basit bir çözüm sunar, ancak güvenlik modeli SELinux kadar ayrıntılı ve esnek değildir.

---

## 3- Paket Yönetimi (aptitude, apt ve dpkg) 🛠️

Linux dağıtımlarında paket yönetimi, yazılım kurulumu, güncelleme ve kaldırma gibi işlemleri gerçekleştirmek için çok önemlidir. dpkg, apt ve Aptitude gibi araçlar, bu işlemleri kolaylaştırmak için kullanılan temel paket yönetim araçlarıdır. Her biri, farklı seviyelerde çalışır ve kullanıcılara farklı işlevsellikler sunar.Bu üç araç arasındaki farkları ve hangi durumlarda kullanılması gerekiyor bakalım

### 3.1 - dpkg (Debian Package) Temel Paket Yönetim Altyapısı
**dpkg**, Debian tabanlı Linux dağıtımlarının temel paket yönetim aracıdır. dpkg, yalnızca düşük seviyede çalışarak, paketlerin kurulumunu, kaldırılmasını ve güncellenmesini sağlar. Bu araç, paketlerin depolama alanında nasıl yönetileceğine dair doğrudan kontrol sağlar, ancak bağımlılıkları çözme veya otomatik güncelleme gibi daha gelişmiş işlevler sunmaz. Temel işlevleri şunlardır:

- **Paket Kurulumu ve Kaldırma:** ```dpkg -i <paket_adı>``` komutuyla bir .deb paketini kurabilir veya ```dpkg -r <paket_adı>``` komutuyla kaldırabilirsiniz.
- **Bağımlılıkları Çözme:** *dpkg*, yalnızca yükleme sırasında gereken bağımlılıkları bildirir; bağımlılıkların yüklenmesi için ayrı bir işlem gerektirir.
- **Paket Durumu İzleme:** Sistemdeki yüklü paketlerin durumunu ```dpkg -l``` komutuyla listeleyebilirsiniz.
- **Paket Güncellemeleri:** *dpkg*, yalnızca mevcut paketlerin güncellenmesi işlemi için kullanılmaz. Bunun için ek araçlar (**apt-get** gibi) gereklidir.

**dpkg**, düşük seviyeli bir araçtır ve genellikle **apt** ve **aptitude** gibi üst düzey araçlarla daha verimli hale gelir. Kullanıcıların doğrudan dpkg kullanması, çoğunlukla karmaşık veya ileri düzey sistem yönetimi gerektiren durumlarla sınırlıdır.

### 3.2 - apt (Advanced Package Tool) Gelişmiş Paket Yönetimi
**apt (Advanced Package Tool)**, dpkg'yi temel alarak çalışan daha yüksek seviyeli bir paket yönetim aracıdır. apt aracı, komut satırında çalışan, kullanıcı dostu ve daha gelişmiş işlevler sunan bir araçtır. apt, özellikle paketlerin kurulumunu, kaldırılmasını ve bağımlılıklarının otomatik olarak çözülmesini sağlar.

**apt'nin temel özellikleri şunlardır:**
- **Paket Yükleme ve Kaldırma:** ```apt install <paket_adı>``` komutuyla bir paketi kurabilir, ```apt remove <paket_adı>``` komutuyla bir paketi kaldırabilirsiniz.
- **Bağımlılık Çözümü:** apt, yüklediğiniz paketlerin tüm bağımlılıklarını otomatik olarak çözer ve eksik paketleri yükler.
- **Paket Güncellemeleri:** ```apt update``` komutuyla paket listelerini güncelleyebilir, ```apt upgrade``` komutuyla mevcut paketleri güncelleyebilirsiniz.
- **Paket Kaynakları Yönetimi:** Paketlerin hangi kaynaklardan indirileceği ```/etc/apt/sources.list``` dosyasına eklenerek yönetilir.

**apt**, dpkg'nin sunduğu tüm temel işlevleri gerçekleştirirken, bağımlılıkları çözme ve paket güncellemeleri gibi işlemleri otomatikleştirir. Bu da kullanıcıya daha kolay bir paket yönetim deneyimi sunar. apt, varsayılan olarak birçok Debian tabanlı sistemde bulunur ve basit komutlarla etkili paket yönetimi sağlar.

### 3.3 - aptitude Gelişmiş ve Etkileşimli Paket Yönetimi
**aptitude**, **apt**'in daha gelişmiş bir versiyonudur ve **dpkg** üzerinde çalışır. Aptitude, apt'in sunduğu tüm temel işlevlere ek olarak, etkileşimli bir arayüz sunar. Bu özellik, özellikle terminalde görsel bir deneyim isteyen kullanıcılar için kullanışlıdır. Aptitude, bir metin tabanlı kullanıcı arayüzü sunarak, kullanıcılara daha fazla kontrol ve esneklik sağlar.

**Aptitude'nin özellikleri şunlardır:**
- **Etkileşimli Arayüz:** Aptitude, kullanıcıya metin tabanlı bir arayüz sunar. Bu arayüz, paketlerin yüklenmesi, kaldırılması ve güncellenmesi işlemlerini daha görsel ve etkileşimli hale getirir. ncurses kütüphanesi ile GUI benzeri bir deneyim sağlar.
- **Gelişmiş Bağımlılık Çözümü:** Aptitude, paketlerin bağımlılıklarını daha gelişmiş bir şekilde yönetir. Paket çatışmaları durumunda, aptitude çözüm önerileri sunar. Bu özellik apt'te bulunmaz.
- **Otomatik Temizlik:** Bir paket kaldırıldığında, aptitude kullanılmayan bağımlılıkları otomatik olarak temizler. apt ise bunun için ek bir komut (```apt autoremove```) gerektirir.
- **why ve why-not Komutları:** Aptitude, yükleme veya kaldırma işlemlerinin neden yapılmadığını öğrenmek için why ve why-not komutlarını sunar.

**aptitude**, apt'ten daha fazla özellik ve daha kullanıcı dostu bir arayüz sunduğu için, gelişmiş kullanıcılar ve daha karmaşık paket yönetimi görevleri için idealdir.

### 3.4 - aptitude, apt ve dpkg Arasındaki Farklar
Bu üç araç arasındaki farklar, genellikle kullanıcı deneyimi ve sunulan özelliklerin seviyeleriyle ilgilidir:

**1-Kullanıcı Arayüzü:**
- dpkg yalnızca komut satırında çalışan düşük seviyeli bir araçtır ve kullanıcı dostu bir arayüz sunmaz.
- apt komut satırında çalışan, kullanıcı dostu ve modern bir araçtır. apt, genellikle dpkg'yi daha erişilebilir hale getirir.
- aptitude ise metin tabanlı etkileşimli bir arayüz sunar ve kullanıcılara GUI benzeri bir deneyim sağlar.

**2-Bağımlılık Çözümü ve Çatışmalar:**
- dpkg, yalnızca paketlerin kurulumunu yapar ve bağımlılıkları manuel olarak çözme gereksinimi vardır.
- apt, bağımlılıkları otomatik olarak çözer ve eksik paketleri yükler. Ancak, paket çatışmaları gibi karmaşık durumlarda çözüm önerisi sunmaz.
- aptitude, paket çatışmalarını yönetirken daha gelişmiş çözümler ve öneriler sunar. Ayrıca, eksik bağımlılıkları da daha iyi yönetir.

**3-Paket Temizliği:**
- dpkg'de, bir paket kaldırıldığında bağımlılıklar manuel olarak temizlenmelidir.
- apt, bir paket kaldırıldığında bağımsız olarak apt autoremove komutunun kullanılması gerekir.
- aptitude, kullanılmayan bağımlılıkları otomatik olarak temizler.

**4-Komut Satırı ve İleri Düzey Özellikler:**
- apt, genellikle basit paket yönetimi işlemleri için yeterli olur ve daha az komut gerektirir.
- aptitude, gelişmiş özellikler ve kullanıcıya daha fazla bilgi sunar. why ve why-not komutları, kullanıcıların paketlerin neden yüklenmediğini veya kaldırılmadığını öğrenmesine olanak tanır.

---

## 4- LVM (Logical Volume Manager) ⚙️

Sistem yöneticileri için disk alanı yönetimi önemli bir görevdir. Bir disk bölümünün disk alanı tükendiğinde, bu genellikle alanı artırmak için uzun ve karmaşık bir dizi işlemi başlatır. LVM (Logical Volume Manager), bu tür durumlarda devreye girerek disk alanı yönetimini daha esnek hale getirir. Özellikle sunucular ya da zamanla değişebilecek depolama ihtiyaçları olan sistemlerde çok faydalıdır.

### 4.1 - Fiziksel Hacim (Physical Volume)

Fiziksel hacimler, fiziksel sabit diskleriniz ya da depolama cihazlarınızdır. Bu cihazlar, tüm sabit diski değil, sadece bir bölümünü kullanabilir. Bu bölümler daha sonra LVM ile birleşerek büyük bir depolama alanı havuzunun (Volume Group) parçası haline gelir. LVM komutları veya işletim sisteminize özel araçlar kullanılarak fiziksel hacimler oluşturulur.

**Örnek:**
Bir sabit diskinin yalnızca bir bölümü, örneğin `/dev/sda1` gibi, fiziksel hacim olarak kullanılabilir.

### 4.2 - Hacim Grubu (Volume Group)

Hacim grubu, birden fazla fiziksel hacmin birleştirilerek büyük bir depolama alanı havuzu (storage pool) haline getirilmesidir. Bu, tüm depolama alanınızı tek bir havuzda birleştirir, böylece alanı daha esnek bir şekilde yönetebilirsiniz.

**Örnek:**
Birden fazla fiziksel hacmi bir araya getirerek tek bir büyük hacim grubu oluşturabilirsiniz. Bu hacim grubu daha sonra mantıksal hacimlere (Logical Volumes) bölünebilir.

### 4.3 - Mantıksal Hacim (Logical Volume)

Mantıksal hacimler, hacim grubundaki depolama alanının bölümlere ayrılmasını sağlar. Buradaki asıl güç, mantıksal hacimlerin ihtiyaç duyulduğunda boyutlarının değiştirilebilmesidir. Bu işlemler veri kaybı olmadan yapılabilir. Yani, bir mantıksal hacmin boyutunu artırabilir veya küçültebilirsiniz. Ayrıca, hacim grubunda alan kalmadığında, daha fazla fiziksel hacim ekleyebilirsiniz.

LVM'nin gücü, mantıksal hacimlerin yönetilmesindedir. Verilerinizi taşımadan, sadece hacmin boyutunu artırarak depolama alanını esnek bir şekilde yönetebilirsiniz. Ayrıca, LVM, bir mantıksal hacmin "anlık görüntülerini" almanıza (snapshot) olanak tanır. Bu, veri yedeklemesi veya değişikliklerin test edilmesi gibi durumlar için faydalıdır.

**Örnek:**
Bir mantıksal hacim, sistemdeki farklı bölümlere (örneğin `/`, `/home`, `/var`) ayrılabilir ve her bir bölüm istenildiği gibi yeniden boyutlandırılabilir.

### 4.4 - Şifreli Bölüm (Encrypted Partition)

Şifreli bölüm, sunucunuzun depolama alanının, şifreleme teknolojisi ile güvence altına alınmış bir kısmıdır. Bu, verilerin doğru şifre çözme anahtarı olmadan okunamayacak şekilde karıştırıldığı anlamına gelir. LVM ile oluşturduğunuz bölümlerde, verilerinizi şifreleyerek daha fazla güvenlik sağlayabilirsiniz. Şifreleme işlemleri genellikle **LUKS** (Linux Unified Key Setup) veya **Anahtar Yönetimi** (Key Management) araçları kullanılarak yapılır.

**Şifreli Bölüm Nasıl Çalışır?**
- Veriler, şifreleme algoritması ile karıştırılır ve yalnızca doğru şifre çözme anahtarı ile geri alınabilir.
- Şifreli bölümler, güvenlik amacıyla sunucularda veya dizüstü bilgisayarlarda kullanılır.

#### LVM'nin Avantajları:
- **Esneklik**: Disk bölümleri kolayca yeniden boyutlandırılabilir, taşınabilir ve yönetilebilir.
- **Yüksek Verimlilik**: Depolama alanı ihtiyacına göre fiziksel hacim ekleyebilirsiniz.
- **Veri Güvenliği**: LVM ile "anlık görüntüler" alarak veri yedeklemesi yapabilir ve değişiklikleri test edebilirsiniz.
- **Şifreleme Desteği**: LVM ile disk bölümlerinizi şifreleyerek veri güvenliğinizi artırabilirsiniz.

#### LVM Kullanım Senaryoları:
- **Sunucu Yönetimi**: Zaman içinde artan depolama ihtiyaçlarını karşılamak için LVM kullanılır.
- **Yedekleme ve Geri Yükleme**: LVM anlık görüntülerini kullanarak verilerinizi güvenli bir şekilde yedekleyebilirsiniz.
- **Veri Taşınabilirliği**: LVM sayesinde verileri taşıma işlemi kolaylaşır, çünkü verilerin bulunduğu bölümü yeniden boyutlandırmak ve taşımak mümkündür.


LVM, disk alanı yönetimini daha esnek ve verimli hale getirirken, veri güvenliğini artırmaya yardımcı olur. Depolama alanı ihtiyaçlarınız değiştikçe, LVM'in sunduğu özelliklerle sistemi kolayca uyarlayabilir ve yönetebilirsiniz.

---

## 5- UFW Servisi (Firewall) 🚨

Bir **Firewall** (Güvenlik Duvarı), bir ağ güvenlik sistemidir ve gelen ve giden ağ trafiğini kontrol eder, belirli bir güvenlik kuralına dayalı olarak hangi trafiğin kabul edileceğine ya da engelleneceğine karar verir. Güvenlik duvarı, yetkilendirilmiş ziyaretçilere (veri paketlerine) izin verir, ancak bu ziyaretçilerin kimliklerini ve kimlik bilgilerini (paket başlıkları) kontrol eder, böylece yalnızca geçerli ve güvenli olanlar içeri girebilir. Şüpheli veya yetkisiz ziyaretçiler (zararlı veri) ise engellenir.

### 5.1 - UFW Nedir?

**UFW (Uncomplicated Firewall)**, **[iptables](https://en.wikipedia.org/wiki/Iptables)** için bir yönetim katmanıdır / ön yüzüdür ve güvenlik duvarı yönetimini basitleştirmeyi amaçlar. UFW, bir güvenlik duvarı değil, aslında bir güvenlik duvarı yönetim aracıdır. UFW, komut satırı (CLI) arayüzüyle çalışır ve karmaşık **iptables** yapılandırmalarını anlamadan kolayca güvenlik duvarı kuralları eklemenizi, kaldırmanızı veya değiştirmenizi sağlar. İptables, Linux çekirdeği tarafından yerleşik olarak sağlanan ve sunucuya yalnızca açık olan portlar üzerinden erişim izni veren bir host güvenlik duvarıdır.

UFW, genellikle **Linux** sunucularında ağ güvenliğini sağlamak için kullanılır ve hem temel güvenlik hem de daha karmaşık yapılandırmalar için kullanıcı dostu bir araçtır.

### 5.2 UFW'nin Temel Özellikleri:

- **Basit Yönetim**: Karmaşık **iptables** komutlarını öğrenmeye gerek kalmadan, kolayca güvenlik duvarı kuralları ekleyebilir ve yönetebilirsiniz.
- **Önceden Tanımlı Profiller**: UFW, SSH erişimi gibi yaygın kullanım senaryoları için önceden tanımlanmış profiller sunar.
- **Bağlantı Kayıtları**: Engellenen bağlantıları kaydederek güvenlik ihlalleri hakkında bilgi verir.
- **Gelişmiş İzleme**: Firewall etkinliğini izleyerek potansiyel güvenlik saldırılarını gözlemlemenizi sağlar.

### 5.3 UFW Temel Komutları
```bash
# UFW'yi kurmak ve başlatmak için aşağıdaki komutları kullanabilirsiniz:
sudo apt update          # Sistem paket listelerini günceller
sudo apt install ufw     # UFW'yi kurar
sudo ufw enable          # UFW'yi etkinleştirir
sudo ufw disable         # UFW'yi devre dışı bırakır
sudo ufw status          # Güvenlik duvarının durumunu görüntüler
sudo ufw status verbose  # Detaylı güvenlik duvarı durumu
sudo ufw allow 22        # Port 22'yi (SSH) açar
sudo ufw allow 80/tcp    # HTTP (port 80) için TCP protokolünü açar
sudo ufw deny 22         # Port 22'yi (SSH) engeller
sudo ufw delete allow 22 # Port 22'yi açma kuralını siler
sudo ufw delete deny 22  # Port 22'yi engelleme kuralını siler (Silme işlemi)
sudo ufw allow OpenSSH   # Önceden tanımlanmış 'OpenSSH' profilini kullanarak port açar
sudo ufw allow 'Nginx Full' # 'Nginx Full' profilini kullanarak HTTP ve HTTPS portlarını açar
sudo less /var/log/ufw.log # UFW tarafından engellenen bağlantıların günlüklerini görüntüler
```
### 5.4 - UFW ile Güvenlik Duvarı Yönetiminin Avantajları
- **Kullanıcı Dostu**: UFW, iptables’a göre çok daha kullanıcı dostudur ve temel ağ güvenliğini sağlamanın kolay bir yoludur.
- **Hızlı Yapılandırma**: Güvenlik duvarı kurallarını hızlı bir şekilde ekleyebilir, silebilir veya değiştirebilirsiniz.
- **Otomatik Güncelleme**: UFW, ağ trafiğini denetlerken herhangi bir güvenlik ihlali durumunda otomatik olarak engelleme yapabilir.
- **Hedef Uygulama Desteği**: UFW, yaygın ağ servisleri için önceden tanımlanmış profiller sunar (örneğin, SSH, HTTP, HTTPS, vb.)

---

## 6- SSH Protokolü 🔐

**Secure Shell (SSH)**, tüm iletişimi şifreleyerek, bir ağ üzerinden güvenli erişim ve uzak bilgisayar yönetimi sağlamaya yarayan kriptografik bir ağ protokolüdür. SSH, ağ üzerinden güvenli bir şekilde iletişim kurmanızı ve bilgisayarlar arasında uzaktan yönetim yapmanızı sağlar.

SSH'nin nasıl çalıştığını 6 ana bölümde inceleyebiliriz:

**1.Client-Server Modeli**
SSH, **istemci-sunucu** mimarisine dayalı çalışır. İstemci, bağlantıyı başlatan ve güvenli iletişim kanalı talep eden tarafken, sunucu bu bağlantıyı kabul eden ve yöneten taraftır.

- **SSH İstemcisi:** İstemci, yerel bilgisayarınızda kullanılan yazılımdır (örneğin, OpenSSH, PuTTY).
- **SSH Sunucusu:** Uzak bilgisayarda çalışan yazılımdır ve bağlantıları kabul edip yönetir.

İstemci, bir web sitesine bağlandığında, web sunucusu bu isteği alır, gerekli dosyaları (örneğin HTML, görseller) alır ve tarayıcınıza geri gönderir. Benzer şekilde SSH'de istemci, sunucuya bağlantı kurar ve güvenli bir iletişim kanalı talep eder.

**2. Bağlantı Başlatma**
İstemci, sunucuya **22 numaralı port** üzerinden bir bağlantı isteği gönderir (SSH’nin varsayılan portu). Bu port numarası, **`/etc/ssh/sshd_config`** dosyasındaki `Port 22` parametresi ile değiştirilebilir.

- **Port 22:** SSH’nin varsayılan portu olup, sunucuda bağlantı noktası olarak kullanılır. Farklı portlar kullanılmak istenirse, SSH konfigürasyonu buna göre yapılandırılmalıdır.

**3. Kimlik Doğrulama**
SSH, kimlik doğrulama için iki yöntem kullanır:

- **Şifre Kimlik Doğrulama:** İstemci, kullanıcı adı ve şifreyi sağlayarak kimlik doğrulaması yapar.
- **Açık Anahtar Kimlik Doğrulama:** İstemci, bir kriptografik anahtar çifti (public ve private anahtarlar) kullanarak kimliğini doğrular.

	- Sunucu, istemcinin açık anahtarını saklar.	
	- İstemci, özel anahtarını kullanarak, sunucudan gelen bir zorluğu şifreler. Yalnızca eşleşen açık anahtar bu zorluğu çözebilir ve kimlik doğrulaması yapılır.

**4. Güvenli Oturum Kurulumu**
Kimlik doğrulama başarılı olursa, güvenli bir oturum kurulur. Bu oturumda kullanılan şifreleme ve bütünlük kontrolü şu şekilde çalışır:

- **Şifreleme:** İstemci ve sunucu arasında gönderilen veriler şifrelenir, böylece dinlemeye karşı korunur.
- **Bütünlük Kontrolü:** SSH, verilerin iletim sırasında değiştirilmediğinden emin olmak için algoritmalar kullanır.

**5. Güvenli İletişim**	
Bağlantı kurulduktan sonra, istemci sunucu ile güvenli bir şekilde iletişim kurar. Bu iletişim genellikle bir terminal gibi bir arayüz üzerinden yapılır.

**6. Oturum Sonlandırma**
Oturum, kullanıcı çıkışı yaparsa veya bağlantı kapatılırsa sona erer.

### 6.1 - SSH Nerelerde Kullanılır?
- **Uzak Sunucu Yönetimi**: Sunuculara güvenli bir şekilde bağlanarak sistem yönetimi, bakım ve konfigürasyon işlemleri yapılabilir.

- **Güvenli Dosya Transferi (SFTP)**: Dosyalar, şifreli bir bağlantı üzerinden güvenli bir şekilde transfer edilebilir.

- **Port Yönlendirme**: Uzak sunuculardaki belirli servislere (web, veritabanı vb.) güvenli erişim sağlamak için port yönlendirmesi yapılabilir.

- **Grafiksel Uygulama Çalıştırma (X11 Forwarding)**: Uzak sunucularda grafiksel uygulamalar çalıştırılabilir, bu uygulamalar yerel bilgisayarınızda görüntülenebilir.

- **Şifreli Tünelleme (VPN Alternatifi)**: İnternet üzerinden güvenli bir tünel kurarak, şifreli iletişim sağlanabilir ve internet trafiği korunabilir.

SSH, genellikle uzak sistemlere güvenli erişim sağlamak ve yönetim işlemleri yapmak için kullanılır.


### 6.2 - SSH ile Nasıl Bağlantı Kurulur?
SSH ile uzak bir sunucuya bağlanmak için aşağıdaki komutu kullanabilirsiniz:

```bash
ssh <kullanıcı_adı>@<sunucu_adresi>
ssh -p <port_numarası> <kullanıcı_adı>@<sunucu_adresi> # Belirli bir port üzerinden
```
Bağlantı sırasında, istemci, sunucunun kimliğini doğrulamak için anahtarını karşılaştırır ve bağlantı şifrelendikten sonra güvenli bir oturum başlatılır.

**Örnek:**
Eğer SSH sunucusu 4242 portu üzerinde çalışıyorsa ve sunucu IP adresi 192.168.1.100 ile kullanıcı adı tuzan42 ise, bağlantıyı şu şekilde kurabilirsiniz:
```bash
ssh -p 4242 tuzan42@192.168.1.100
```
Not: Sunucu üzerinde SSH'nın belirli bir port üzerinden dinleyebilmesi için, /etc/ssh/sshd_config dosyasındaki Port parametresinin uygun şekilde yapılandırılmış olması gerekir.Ayrıca ufw servisi aktif durumda ise erişilmek istenen port'a izin verilmesi gerekir.

---

## 7- VM Kurulum 📝

> ### :warning: Önkoşullar
>- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) yüklü olmalıdır;
>- [Debian GNU/Linux OS için ISO (Optik Disk Görüntüsü) yükleyici dosyasını](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/) indirmiş olmalısınız.

### 7.1 - Sanal Makine (VM) Ayarları

1. ```Virtual Box```
2. ```Yeni```
3. VM'yi adlandırın:
4. VM için hedef klasörü seçin: ```../sgoinfre/username/``` 
5. ISO Kalıbını seçin:
6. Katılımsız kurulumu atla: ```✓```
7. ```Donanım```
- VM'ye ayrılan bellek (RAM) miktarını seçin – önerilen bellek boyutu: ```1024 MB```
- Sanal işlemci sayısı: ```1 işlemci```
8. ```Sabit Disk```
- Sanal bir sabit disk oluştur:
- Bonuslu kurulum için: ```30.8 GB``` yer ayırın 
- Yeni sanal sabit disk için kullanılacak dosya türü olarak: ```VDI``` (VirtualBox Disk Görüntüsü) öğesini seçin
9. ```Bitir``` dedikten sonra VM' i ```Başlat``` 

### 7.2 - İşletim Sistemi Debian Kurulum

Bu kurulumda Rocky Linux yerine Debian seçimi, özellikle yeni başlayanlar için genel olarak daha kullanıcı dostu ve erişilebilir bir işletim sistemi olarak kabul ediliyor

1. Debian GNU/Linux yükleyici menüsünden seçim yapın; ```Install```
2. Ayarlar
- Dil: ```English```
- Yer: ```other```
- Kıta: ```Asia```
- Ülke: ```Türkiye```
- Yerel ayar: ```United States```
- Tuş Haritası: ```Turkish Q```
- Ana bilgisayar adı(hostname): ```<username>42```
- Alan adı(domainname): ```boş(blank)```
- Root şifresi: ```********** ```
- Kullanıcı tam adı: ```<username>```
- Kullanıcı adı: ```<username>```
- Kullanıcı şifresini ayarlayın: ```**********```

3. Disk Bölümleme
- Bölümleme yöntemi: ```Manual```
- Kullanılabilir birimi seçin:
- Seçilen cihazda yeni boş bölüm oluşturun: ```Yes```

Diskte en az bir birincil (**primary**) bölüm oluşturulmalıdır. Bu bölüm genellikle /boot için gereklidir.

>Not: /boot bölümü LVM (Logical Volume Manager) olarak oluşturulamaz. LVM, özellikle önyükleme işlemleri için gereken bootloader'ların (örneğin, GRUB) doğru şekilde çalışmasını zorlaştırabilir. Ayrıca, bir bölüm oluştururken önyüklenebilir bölümleri (bootable partitions) diskin en başına yerleştirmek ve bu bölümleri ilk olarak oluşturmak, iyi bir alışkanlık olarak kabul edilir.
>Ek Açıklama: Bu notun geçerliliği, kullanılan sistemin türüne bağlı olarak değişebilir. BIOS tabanlı sistemlerde önyükleme işlemi genellikle diskin başında bulunan birincil bölüme bağlıdır, bu yüzden boot bölümü başta olmalıdır. UEFI tabanlı sistemlerde ise bu kısıtlama daha esnektir ve önyükleme için genellikle daha farklı bir bölüm (örneğin, EFI System Partition) kullanılır. Ancak yine de /boot bölümü için en başta yer ayırmak genellikle iyi bir pratik olarak kabul edilir.

- 3.1  Birincil (Primary) Bölüm Oluştur
	- Ayarlarını değiştirmek için bir bölüm seçin: ```FREE SPACE```
	- Bu boş alan nasıl kullanılır: ```Create a new partition```
	- Yeni bölüm boyutunu Bayt cinsinden girin: ```525336576 B```
	>1 B × 1024 = 1 KB
	>1 KB × 1024 = 1 MB (1024 × 1024)
	>1 MB × 1024 = 1 GB (1024 × 1024 × 1024)
	>1024, **2'nin 10. kuvveti** yani  
	> `2^10 = 1024` 'tür.  
	>Bilgisayarlar için bu sayı, bellek boyutlarını ve veri birimlerini ifade etmek için oldukça uygun bir değerdir.
	>Sector: Diskteki en küçük veri birimi (yazma/okuma işlemleri sektörler üzerinden yapılır).
	>Cluster: Diskteki veri birimi grubu. Bir dosya sistemi veri saklamak için bu küme birimlerini kullanır.
	- Yeni bölüm türü: ```Primary```
	- Yeni bölümün konumu: ```Beginning```
	- Bu bölüm için bağlama noktası (mount points): ```/boot```
	- Önyüklenebilir bayrağı(Bootable flag): ```on```
	- Bölüm ayarları: ```Done setting up the partition```

**/boot** dizini, bir Linux sisteminde önyükleme (boot) işlemi için gerekli olan dosyaları içerir. Bilgisayar açılırken işletim sistemi çekirdeği (kernel) ve gerekli önyükleyici (bootloader) dosyaları bu dizinden yüklenir.

- **3.2  Mantıksal Bölüm (Logical Partition) Oluştur**
	> Diskte sınırsız sayıda (Logical)mantıksal bölüm oluşturulabilir.
	- Ayarlarını değiştirmek için bir bölüm seçin: ```FREE SPACE```
	- Bu boş alan nasıl kullanılır: ```Create a new partition```
	- Yeni bölüm boyutunu şu şekilde ayarlayın: max ```continue```
	- Yeni bölüm türü: ```Logical```
	- Bu bölüm için bağlama noktası: ```Do not mount it```
	- Bölüm ayarları: ```Done setting up the partition```

- **3.3 Birimleri Şifreleme (Encrypting Volumes)**
	- Şifrelenmiş birim konfigürasyonu: ```Configure encrypted volumes```
	- Değişiklikleri diske yazın ve şifrelenmiş birimleri yapılandırın?: ```Yes```
	- Şifrelenmiş bölüm oluştur: ```Create encrypted volumes```
	- Şifrelenecek cihazları seçin(space ile): ```/dev/sda5```
	- Bölüm ayarları: ```Done setting up the partition```
	- Şifreleme yapılandırma eylemleri: ```Finish```
	- (Şifreleme için onay mesajı:) ```Yes```
	- (İsteğe bağlı) – aslında şifrelenecek hiçbir şey olmadığı için ```Cancel```
	- Şifreleme parolasını ayarla: ```**********```

- **3.4 Mantıksal Birim Yöneticisi (LVM) Logical Volume Manager Konfigürasyon**
	- ```Configure the Logical Volume Manager```
	- (Onay mesajı:) ```Yes```
	Create Volume Group - Birim Grubu Oluştur
	- ```Create volume group```
	- Volume group adını girin: ```LVMGroup```
	- Grubu depolamak için bölümü seçin(space ile): ```/dev/mapper/sda5_crypt```
	Create Logical Partitions - Mantıksal Bölümleri Oluşturun
	- LVM yapılandırma eylemi: ```Create logical volume```
	- Yeni mantıksal birimin oluşturulması gereken birim grubunu seçin: ```LVMGroup```
	- Mantıksal birim adını girin (örn: root)
	- Yeni mantıksal birimin boyutunu girin (örn: 10737418240 B)
	- Aşağıdaki birimlerin her biri için yukarıdaki adımları yineleyin:
	- LVM yapılandırma eylemi: ```Finish```

	| Logical Volume Name | Logical Volume Size | Conversion / Calculation                 | Logical Volume Size in Bytes |
	|---------------------|---------------------|------------------------------------------|------------------------------|
	| root                | 10G                 | 10 × 1024 × 1024 × 1024                  | 10737418240 B                |
	| swap                | 2.3G                | 2.3 × 1024 × 1024 × 1024 (2469606195.2 B) | 2469607424 B                 |
	| home                | 5G                  | 5 × 1024 × 1024 × 1024                   | 5368709120 B                 |
	| var                 | 3G                  | 3 × 1024 × 1024 × 1024                   | 3221225472 B                 |
	| srv                 | 3G                  | 3 × 1024 × 1024 × 1024                   | 3221225472 B                 |
	| tmp                 | 3G                  | 3 × 1024 × 1024 × 1024                   | 3221225472 B                 |
	| var-log             | 4G                  | 4 × 1024 × 1024 × 1024                   | 4294967296 B                 |


- **3.5 Bağlama Noktası(Mount Points) Ayarlama**
	- Select volume - Oluşturduğunuz LVM bölümünü seçin 
	- Partition settings > set Use as: (Dosya Sistemini Seç örn: ext4 gibi)
	- Bağlama noktasını(mount points) ayarla
	- Ayarları kaydet: ```Done setting up the partition```
	- Aşağıdaki tablodaki birimlerin her biri için yukarıdaki adımları yineleyin: Bonus resim'e bak

	- **İşlemler bittikten sonra** :```Finish partitioning and write changes to disk```
	- (Onay mesajı:) ```Yes```

	| Partition | Volume Name | Use        | Mount Point       | Enter        |
	|-----------|-------------|------------|-------------------|--------------|
	| #1        | home        | Ext4       | /home             |              |
	| #1        | root        | Ext4       | /                 |              |
	| #1        | srv         | Ext4       | /srv              |              |
	| #1        | swap        | swap area  |                   |              |
	| #1        | tmp         | Ext4       | /tmp              |              |
	| #1        | var         | Ext4       | /var              |              |
	| #1        | var-log     | Ext4       | /var/log          | Enter manually |

	>EXT4, Linux tabanlı sistemlerde kullanılan, gelişmiş veri yönetimi ve yüksek performans sunan bir dosya sistemidir. Geliştirilmiş dosya boyutu desteği, hızlı veri erişimi ve hata toleransı gibi özellikleri ile öne çıkar.

**/home (EXT4)**: Kullanıcıların kişisel verilerini, belgelerini, ayarlarını ve yapılandırmalarını sakladığı ana dizindir. Her bir kullanıcı için ayrı bir alt dizin bulunur (örneğin, /home/kullanici).

**/ (ROOT - EXT4)**: Sistem dosyalarının ve tüm işletim sistemi yapısının temel olduğu kök (root) dizinidir. Tüm diğer dosya yolları buradan başlar ve kök dizini sistemi kontrol eden en yüksek seviyedeki dizindir.

**/srv (EXT4)**: Sunucuya ait veri ve servislerin barındırıldığı dizindir. Genellikle web siteleri, FTP sunucuları gibi hizmetlerin verilerini depolamak için kullanılır.

**swap (SWAP area)**: RAM yetersiz olduğunda, aktif olmayan verileri depolamak için kullanılan disk alanıdır. Swap, belleği takviye ederek sistemin daha stabil çalışmasını sağlar.

**/tmp (EXT4)**: Geçici dosyaların saklandığı dizindir. Sistem, uygulamalar ve kullanıcılar burada geçici dosyalar oluşturur, ancak genellikle bu dizindeki veriler bir yeniden başlatma ile temizlenir.

**/var (EXT4)**: Değişken (varied) veri dosyalarının bulunduğu dizindir, yani sistemin çalışma sırasında büyüyen ve değişen dosyalar burada bulunur. Örneğin, günlük dosyaları (log), posta kutuları ve spool dosyaları burada yer alır.

**/var/log (EXT4)**: Sistem günlük dosyalarının (log) bulunduğu alt dizindir. Bu dosyalar, sistemin, uygulamaların ve servislerin çalışma durumu hakkında bilgi sağlar.

Bu yapı, sistemin düzenli ve verimli çalışmasını sağlamak için dosya sistemlerinin ve dizinlerin belirli işlevler için ayrılmasını sağlar.

- **3.6 Ek Paketler ve Bootloader Kurulum**
	- Ek paketler configure the package manager: ```No```
	- Ülke: ```Türkiye```
	- Debian arşiv ayna paket yöneticisini ayarlayın: ```deb.debian.org```
	- HTTP proxy'si: ```(blank)boş```
	- ```Continue```
	- İstatislikler: ```No```
	- Tüm yazılım seçeneklerini ```✓``` kaldırın(space ile) ve ```Continue```
	- GRUB önyükleyici kurulumu: ```Yes```
	- Önyükleyiciyi yüklemek için cihazı seçin: ```/dev/sda (ata_VBOX_HARDDISK_VBfe54..)```
	- ```Continue```

- **3.7 Sisteme Giriş**
	- Diski şifreledik şifrenizi girin: ```<encryption-password>```
	- Kullanıcı adı: ```<username>```
	- Parola: ```<user-password>```

> Kurulum Başarı ile tamamlandı . Şimdi Konfigürasyon'a geçelim

## 8- Konfigürasyon (Configuration) ✅

### 8.1 -  Sistemi güncelleme ve sudo komutunu yapılandırma

- **```su -```** : Kök root kullanıcı olarak oturum açın.
- **```apt update -y && apt upgrade -y```** : Sistem güncellemeleri getiriliyor, getirilen güncellemeleri ve yükseltmeleri yapalım. Tüm izin kabulünü otomatikleştirmek için -y.
- **```apt install sudo```**: sudo paketini yükleyin
- **```dpkg -l | grep sudo sudo```**: paketinin başarıyla yüklenip yüklenmediğini doğrulayın
- **```usermod -aG sudo your_username```** : "your_username" kullanıcısını "sudo" grubuna eklerken, mevcut grup üyeliklerini olduğu gibi korur.
	- Gruplar, her kullanıcıya bireysel izinler vermek yerine, kullanıcıları gruplar içinde organize ederek yönetmeyi kolaylaştırır. Bir grup, belirli bir rol veya erişim düzeyine sahip kullanıcıları bir araya getirir. Bu şekilde, aynı türdeki kullanıcılar için topluca izinler veya erişim hakları atanabilir.
	usermod -aG komutu, kullanıcı hesaplarını değiştiren bir komuttur ve kullanıcının mevcut grup üyeliklerini koruyarak belirtilen yeni gruba ekler. -a (append) seçeneği, kullanıcının mevcut grupları olduğu gibi bırakırken, ona ek bir grup ekler. Bu, kullanıcının eski grup üyeliklerinin silinmesini engeller.
    
- **```getent group sudo```**: getent group sudo komutu, getent komutunu kullanarak "sudo" grubuna ait bilgileri getirir. getent, Linux/Unix sistemlerinde çeşitli veritabanlarından (örneğin, grup veritabanı, kullanıcı veritabanı, ağ hizmetleri veritabanı, vb.) bilgi almak için kullanılan bir komuttur.Bu komut, sistemin yerel veritabanından sudo grubuyla ilgili bilgileri alır. Bu bilgiler, grubun üyeleri, grup adı ve grup ID'si gibi temel bilgileri içerir.

- **```groups <username>``` (alternatif)**: belirtilen <username> kullanıcısının ait olduğu tüm grupları listelemek için kullanılır. 


### 8.2 Sudo'nun Temel Özellikleri ve Kullanımı
**Super User Do (SUDO)** ifadesi, düşük yetkilere sahip kullanıcıların yüksek yetki gerektiren işlemleri gerçekleştirebilmesi için kullandıkları bir komut ve gruptur.

**Sudo, iki ana bileşenden oluşur**:
  1. **Grup**: Kullanıcılar, yüksek yetki gerektiren işlemleri gerçekleştirebilmek için "sudo" grubunun üyesi olmalıdır.
  2. **Komut**: Kullanıcılar, `sudo <command>` şeklinde komutları çalıştırarak yüksek yetkilere sahip olabilirler.

**Sudo ile komut çalıştırma**:
Kullanıcılar, `sudo <command>` şeklinde bir komut yürüterek, o komutu yönetici (root) haklarıyla çalıştırabilirler.
  
**Sudo ile çalışmayan komutlar**:
Sudo, **Shell Redirection** ve **Shell Built-in komutlarıyla** çalışmaz. (Örneğin `man builtins` komutunda yer alan komutlar).

**Sudoers dosyası**:
Sudo komutunun yapılandırma dosyası **`/etc/sudoers`** dosyasıdır.
Sudo yetkileri, kullanıcılar ve komutlar için bu dosyada belirlenir ve sınırlamalar getirilebilir.
`/etc/sudoers` dosyasına ek olarak, **`/etc/sudoers.d/`** dizini altındaki parçalı kurallar da dahil edilebilir.

**Visudo komutunun kullanımı**:
`visudo` komutu, sudoers dosyasını düzenlemek için önerilen komuttur.
Bu komut, syntax hatalarını kontrol eder ve kullanıcıyı bilgilendirir.


- **```visudo```**: komutunu çalıştırarak **sudoers** dosyasını açın, ardından 
```# User privilege specification``` kısmını bulun ve "**your_username ALL=(ALL) ALL**" satırını ekleyin. 
**Sudoers dosyasındaki ALL ifadeleri**:
  - **`your_username ALL=(ALL:ALL) ALL`** ifadesindeki **ALL** şunları belirtir:
    - **Tüm terminallerden** (tty'lerden) komut çalıştırılabilir.
    - **Tüm kullanıcılar ve gruplar adına** komut çalıştırılabilir.
    - **Tüm komutları** çalıştırabilme yetkisi tanımlanır.

  
**Sudo Ekstra Bilgilendirme**
- `username	ALL(ALL:ALL) ALL NOPASSWD` ifadesi: Sudo kullanımında, **parola** istenmemesini sağlar.
- Grup bazlı izinler: **`%sudo`**, **`%admin`** gibi ifadeler, grupları (ve dolayısıyla grup üyelerini) kapsamayı ifade eder.
- Cmnd_Alias	UPDATE = /usr/bin/apt update , gibi alias takma isimler oluşturulabilir.
İstisnalar ve çoklu tanımlar yapılabilir.
`!`  Bunlar hariç diye de belirtebiliyoruz
`username	ALL(ALL:ALL) !/usr/sbin/reboot`  (reboot harici kullanabilsin gibi) 
`Cmnd_Alias UPDATE = /usr/bin/apt, !/usr/bin/apt install, !/usr/bin/apt upgrade`
`username	ALL(ALL:ALL) UPDATE` şeklindede aliaslarımızı kullanabiliriz.
- Bir kullanıcının **sudo** yetkilerini görüntülemek için **`sudo -lU <username>`** komutunu kullanabilirsiniz. 
- **`sudo -l`** komutu çalıştırılan kullanıcı için **sudo** izinlerini listeler.

**Sudoers dosyasını, günlüklerini, uyarı mesajını vs yapılandırmaya devam edelim**

**Aşağıdakileri tanımları dosyaya ekleyin;**
```bash
Defaults  passwd_tries=3 # 'sudo' şifresini girmek için toplam deneme sayısı
Defaults  badpass_message="Wrong Password !" # Yanlış şifre senaryosuna yazdırılacak mesaj
Defaults  logfile="/var/log/sudo/sudo.log" # log için özel günlük dosyası ayarlayın
Defaults  log_input, log_output #Neler kaydedilecek
Defaults  requiretty # gerçek bir TTY'den 'sudo' çağrısını etkinleştirir, ancak 'cron' veya 'cgi-bin' gibi yöntemlerle etkinleştirmez
Defaults  secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" #sudo ile çalıştırılan her komut için kullanılan yol
```

>Eklemeyi bitirdikten sonra kayıt `ctrl + s,` çıkış `ctl + x`

- **`mkdir -p /var/log/sudo`**: dizin oluştur
- **`touch /var/log/sudo/sudo.log`**: dosya oluştur
**`chown root:root /var/log/sudo/sudo.log`**: dosya sahipliği 
**`chmod 640 /var/log/sudo/sudo.log`**: root harici log dosyasını değiştiremesin ama okuyabilsin

> Artık sudo yapılandırmamız bittiğine göre root kullanıcısından kendi kullanıcımıza geçelim `exit` diyerek yada `su username` ile geçebilirsiniz `sudo` komutlarını kullanarak işlemlere devam edebiliriz

## 8.3 - SSH (Secure Shell)
Bu, güvenli olmayan bir ağ üzerinden bilgisayarlar arasında uzaktan yönetim ve güvenli iletişim için önemli bir adımdır. SSH, sanal makinenize uzaktan erişmek ve kontrol etmek için güvenli bir yol sağlar.

- **`sudo apt install openssh-server:`**: Bileşeni yükleyin (openssh-server) makinenize güvenli uzaktan erişim sağlamaktan sorumludur.

- **`sudo systemctl status ssh:`** Systemctl durumu, bir hizmetin çalışıp çalışmadığı, geçerli durumu ve hizmetle ilgili son günlük iletileri hakkında ayrıntılı bilgileri gösterir. Burada SSH servisinin sistem üzerindeki durumunu kontrol ediyoruz.

- **`sudo apt install vim `**: vim kuralım
- **`sudo vim /etc/ssh/sshd_config:`** ssh sunucusu yapılandırma dosyasını düzenleme. SSH arka plan programı için sshd, gelen SSH bağlantılarını işlemek için bir sunucuda çalışan bir arka plan işlemi veya hizmetidir. Gelen SSH bağlantılarını işlemekten sorumludur ve davranışı bu yapılandırma dosyasındaki ayarlar tarafından belirlenir. Yapılandırmalardan bazıları Bağlantı Noktası Numarası, PermitRootLogin, PasswordAuthentication, PubkeyAuthentication ve AllowUsers veya AllowGroups'u içerir.
> press i 
- **`#Port22`** satırını, **`Port 4242`** olarak değiştirin.
- Kimlik doğrulama mekanizmasından bağımsız olarak root olarak SSH oturum açmayı yasaklamak için **`#PermitRootLogin prohibit-password`** değerini **`PermitRootLogin no`** olarak ayarlayın
> esc !wq

- **`sudo grep Port /etc/ssh/sshd_config:`**: bu komut dosyayı doğrudan okuyacak ve size bellekte şu anda etkin olan yapılandırmayı değil, dosyadaki mevcut Bağlantı Noktası değerini gösterecektir. Sudo systemctl status ssh'yi çalıştırırsanız, size bağlantı noktasının güncellenmediğini gösterecektir.

### 8.4 - UFW'nin Kurulması ve Yapılandırılması

////////////
