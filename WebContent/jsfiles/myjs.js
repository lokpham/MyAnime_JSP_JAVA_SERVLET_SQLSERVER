/**
 * 
 */
const button = document.querySelector(".container");
button.addEventListener("click",()=>{
	console.log('xin chao');
});
class CustomTag extends HTMLElement {
  constructor() {
    super();
	this.style.backgroundColor = 'red';
    // Các công việc khởi tạo khi tạo ra một thể hiện của thẻ
    // Ví dụ: tạo các phần tử con, điều chỉnh kiểu dáng, sử lý sự kiện, ...
  }

  

}


// Đăng ký custom element với tên "custom-tag"
customElements.define('custom-tag',CustomTag);