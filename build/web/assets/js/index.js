/*=============== SWIPER JS ===============*/
let swiperCards = new Swiper(".card__content", {
    loop: true,
    spaceBetween: 32,
    grabCursor: true,
  
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
      dynamicBullets: true,
    },
  
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  
    breakpoints:{
      600: {
        slidesPerView: 2,
      },
      968: {
        slidesPerView: 3,
      },
    },
  });
 // code take order for customer
  function Order_services(){
    var size="";
    var arr = document.getElementsByName("size");
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].checked) {
           size = arr[i].value;
        }
     }
     console.log(size);

      var type="";
      var arr_Type = document.getElementsByName("typePet");
      for (var i = 0; i < arr_Type.length; i++) {
          if (arr_Type[i].checked) {
            type = arr_Type[i].value;
          }
      }     
      console.log(type);

     var str_ser = ""; 
     var arr_ser = document.getElementsByName("service");
     for (var i = 0; i < arr_ser.length; i++) {
        if (arr_ser[i].checked) {
          str_ser= str_ser + arr_ser[i].value +"<br/>"
        }
     }
     console.log(str_ser);
     var namePet = document.getElementById('name_pet').value
     console.log(namePet);
     
     var table = document.getElementById("bootstrap-data-table");
    var row = table.insertRow(1); // Thêm một hàng mới vào bảng

    var cell1 = row.insertCell(0); // Thêm một ô mới vào hàng
    cell1.innerHTML = namePet; // Gán giá trị cho ô

    var cell2 = row.insertCell(1);
    cell2.innerHTML = type;

    var cell3 = row.insertCell(2);
    cell3.innerHTML = size;

    var cell4 = row.insertCell(3);
    cell4.innerHTML = str_ser;
    }