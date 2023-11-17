# Mobile Repository - Capstone Alterra Academy

### Generage ENV
1. Copy `.env.example` dan paste menjadi `.env`
2. Pada file `.env`, isi variabel API_URL dengan URL dari API yang disediakan oleh tim backend

   <img width="636" alt="image" src="https://github.com/capstone-kelompok-7/mobile-disappear/assets/43428328/cde6645d-49e0-4812-89a3-1b3c3a0281e0">

4. Setelah itu jalankan perintah:
   
    ```bash
    dart run build_runner build
    ```
5. Setelah itu akan muncul file `lib/env/env.g.dart`:

    <img width="748" alt="image" src="https://github.com/capstone-kelompok-7/mobile-disappear/assets/43428328/72a1d793-f9c3-4555-8524-55091cd25842">


### Git Flow
Git flow terdiri dari 2 branch utama, yaitu **main** dan **development**.

<img width="501" alt="image" src="https://github.com/capstone-kelompok-7/mobile-disappear/assets/43428328/5f9f0cb0-716d-46b8-a97a-131b5ac2908a">

**development** adalah *branch* tempat kita ngoding, sedangkan **main** adalah *branch* utama dan branch **main** tidak boleh digunakan untuk ngoding.

### Penamaan Branch
- Jika kamu bermaksud untuk meng-_improve_ atau memperbaharui
  > `git checkout -b "improvement/apa-yang-di-improve"`
- Jika kamu bermaksud untuk membuat sebuah _feature_
  > `git checkout -b "feature/nama-feature"`
- Jika kamu bermaksud untuk fix sebuah bug
  > `git checkout -b "bugfix/apa-yang-kamu-fix"`

### Merging dari branch fitur ke development
Gunakan **Pull Request** kalau ingin menggabungkan atau _merge_ branch fitur (branch yang kalian pake ngoding) ke branch **development**.

### State Management
Untuk *state management* kita bakal pakai **provider**.

### Struktur folder
Project ini menggunakan arsitektur **MVVM** atau Model-View-ViewModel, jadi struktur foldernya kira-kira seperti ini:
<br><br>
<img width="154" alt="image" src="https://github.com/capstone-kelompok-7/mobile-disappear/assets/43428328/a10459b7-589d-4628-8069-d4478d6cf51d">
<br>
* **models** untuk menaruh model-model yang ada, model ini seperti entitas kalo didatabase, model ini kita pakai sebagai data.
* **screens** untuk menaruh view atau UI dari app kita.
* **services** untuk menaruh _service_, yang mana merupakan tempat untuk menaruh kodingan yang berhubungan dengan pengambilan API atau _fetch_ API.
* **view_models** untuk menaruh ViewModel, yang mana merupakan _controller_ untuk masing-masing view atau UI. Nantinya ViewModel itu meng-extends kelas **ChangeNotifier**-nya package **provider**.

### API adapter
<img width="497" alt="image" src="https://github.com/capstone-kelompok-7/mobile-disappear/assets/43428328/7b464a18-2f7d-4f56-acda-73d9723dac2a">
<br>
Untuk memanggil API bisa menggunakan fungsi **createDio** yang ada di `lib/services/api.dart`

### API Documentation
Untuk API-API nya bisa dilihat disini:
[Link Postman](https://documenter.getpostman.com/view/29878742/2s9YXceQx7).
