<%-- 
    Document   : home
    Created on : Mar 9, 2024, 1:08:44 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- css -->
        <link rel="stylesheet" href="assets/css/Homestyle.css">
        <!--=============== REMIXICONS ===============-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">
        <!--=============== SWIPER CSS ===============-->
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
        <!--=============== BOOTSTRAP ===============-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!--=============== LORDICON ===============-->
        <script src="https://cdn.lordicon.com/lordicon.js"></script>
    </head>
    <body>
        <header class="header">
            <div class="logoContent">
                <a href="#" class="logo"><img style="background: white; border-radius: 50%; margin-right: 5px;" class="img-fluid" src="images/doglogo.png" alt=""></a>
                <h1 class="logoName">Pet Services </h1>
            </div>

            <nav class="navbar">
                <a style="display: block;" href="#home"><lord-icon
                        src="https://cdn.lordicon.com/wvceonwa.json"
                        trigger="hover"
                        style="width:50px;height:40px"
                        >
                    </lord-icon></a>

                <a href="#product"><lord-icon
                        src="https://cdn.lordicon.com/ssoifezn.json"
                        trigger="hover"
                        style="width:50px;height:40px"
                        >
                    </lord-icon></a>

                <a href="#review"><lord-icon
                        src="https://cdn.lordicon.com/jibstvae.json"
                        trigger="hover"
                        style="width:50px;height:40px"
                        >
                    </lord-icon></a>

                <a href="#contact"><lord-icon
                        src="https://cdn.lordicon.com/wzrwaorf.json"
                        trigger="hover"
                        style="width:50px;height:40px"
                        >
                    </lord-icon></a>

                <a href="#order" style="background: #48463a33; padding: 5px 15px 5px 5px; border-radius: 10px;display:flex ;align-items: center;justify-content: center;"><lord-icon
                        src="https://cdn.lordicon.com/odavpkmb.json"
                        trigger="hover"
                        style="width:50px;height:40px"
                        >
                    </lord-icon>
                    <span class="number_order" style="margin-left: 10px;font-size: medium;color: #08A88A;">0</span>
                </a>

            </nav>

            <div class="user">
                <span >Sigh Up</span> |
                <a href="formLogin.jsp" >Sign In</a>
            </div>
        </header>

        <section id="home" class="home" style= "background: url(images/img_for_home.jpg) no-repeat;">

            <form class="form" action="">
                <!--typePet-->
                <div class="typePet" style="border: solid #2222 1px 9px; background-color: #2222;border-radius: 9px 9px 0px 0px; padding: 10px 0px;">

                    <span> I'm looking for service for my:</span>
                    <input type="radio" class="pet" name="typePet" value="Dog" required>
                    <label class="tick_pet" for="pet">Dog</label>
                    <input type="radio" class="pet" name="typePet" value="Cat" required>
                    <label class="tick_pet" for="pet">Cat</label>
                    <input type="radio" class="pet" name="typePet" value="Mouse" required>
                    <label class="tick_pet" for="pet">Mouse</label>
                    <input style="padding-left: 10px; border-radius: 10px; margin-left: 95px;" type="text" name="name" id="name_pet" placeholder="Name Pet" required>
                </div>
                <!--services-->
                <span>Pet Services:</span> &ensp;          
                <div class="content">
                    <div class="box">
                        <input type="checkbox" name="service" value="Booking" >
                        <div class="boxContent"></i>Booking</div>
                    </div>

                    <div class="box">
                        <input type="checkbox" name="service" value="Spa" >
                        <div class="boxContent"></i>Spa</div>
                    </div>

                    <div class="box">
                        <input type="checkbox" name="service" value="Grooming" >
                        <div class="boxContent">Grooming</div>
                    </div>                   
                </div>
                <!--size pet-->
                <span>Pet Size:</span> &ensp;          
                <div class="content">


                    <div class="box">
                        <input type="radio" name="size" value="Small" required>
                        <div class="boxContent">Small</div>
                    </div>

                    <div class="box">
                        <input type="radio" name="size" value="Medium" required>
                        <div class="boxContent">Medium</div>
                    </div>

                    <div class="box">
                        <input type="radio" name="size" value="Large" required>
                        <div class="boxContent">Large</div>
                    </div>

                    <div class="box">
                        <input type="radio" name="size" value="Giant" required>
                        <div class="boxContent">Giant</div>
                    </div>                
                </div>

                <!--Confirm data input-->
                <div class="checkbox-wrapper">
                    <input required id="terms-checkbox-37" name="confirm" value="confirm" type="checkbox">
                    <label class="terms-label" for="terms-checkbox-37">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 200 200" class="checkbox-svg">
                        <mask fill="white" id="path-1-inside-1_476_5-37">
                            <rect height="200" width="200"></rect>
                        </mask>
                        <rect mask="url(#path-1-inside-1_476_5-37)" stroke-width="40" class="checkbox-box" height="200" width="200"></rect>
                        <path stroke-width="15" d="M52 111.018L76.9867 136L149 64" class="checkbox-tick"></path>
                        </svg>
                        <span style="margin-left: -5px; margin-bottom: 3px;" class="label-text">Confirm the data is correct</span>
                    </label>
                </div>
                <!--Request-->
                <button onclick="Order_services()" class="sub_btn" style="width: 150px;height: 50px;margin-bottom: 20px;margin-left: 20px;">
                    <svg height="24" width="24" fill="#FFFFFF" viewBox="0 0 24 24" data-name="Layer 1" id="Layer_1" class="sparkle">
                    <path d="M10,21.236,6.755,14.745.264,11.5,6.755,8.255,10,1.764l3.245,6.491L19.736,11.5l-6.491,3.245ZM18,21l1.5,3L21,21l3-1.5L21,18l-1.5-3L18,18l-3,1.5ZM19.333,4.667,20.5,7l1.167-2.333L24,3.5,21.667,2.333,20.5,0,19.333,2.333,17,3.5Z"></path>
                    </svg>

                    <span class="text">Order</span>
                </button>
            </form> 
        </section>

        <!-- slide -->

        <div style="display: block;" class="slide_product" id="product">
            <h2 style="text-align: center;font-size: 40px;margin: 20px;font-family: cursive;">Our Exclusive Services</h2>
            <div class="card__container swiper">
                <div class="card__content">
                    <div class="swiper-wrapper">
                        <article class="card__article swiper-slide">
                            <div class="card__image">
                                <img src="./images/food-pet-dog-1.png" alt="image" class="card__img">
                                <div class="card__shadow"></div>
                            </div>

                            <div class="card__data">
                                <h3 class="card__name">Food 1</h3>
                                <p class="card__description">
                                    Royal Canin Poodle Puppy là dòng thức ăn dành riêng cho chó Poodle con. 
                                    Với kiểu dáng hạt, hàm lượng dinh dưỡng sản phẩm mang đến cho những chú Poodle bộ lông mềm mượt,
                                    hệ thống miễn dịch tốt và sức khỏe dẻo dai.
                                </p>

                                <a href="#" class="card__button">Order</a>
                            </div>
                        </article>

                        <article class="card__article swiper-slide">
                            <div class="card__image">
                                <img src="./images/food-pet-2.png" alt="image" class="card__img">
                                <div class="card__shadow"></div>
                            </div>

                            <div class="card__data">
                                <h3 class="card__name">Food 2</h3>
                                <p class="card__description">
                                    Royal Canin Poodle Puppy là dòng thức ăn dành riêng cho chó Poodle con. 
                                    Với kiểu dáng hạt, hàm lượng dinh dưỡng sản phẩm mang đến cho những chú Poodle bộ lông mềm mượt,
                                    hệ thống miễn dịch tốt và sức khỏe dẻo dai.
                                </p>

                                <a href="#" class="card__button">Order</a>
                            </div>
                        </article>

                        <article class="card__article swiper-slide">
                            <div class="card__image">
                                <img src="./images/food-pet-dog-2.png" alt="image" class="card__img">
                                <div class="card__shadow"></div>
                            </div>

                            <div class="card__data">
                                <h3 class="card__name">Food 3</h3>
                                <p class="card__description">
                                    Royal Canin Poodle Puppy là dòng thức ăn dành riêng cho chó Poodle con. 
                                    Với kiểu dáng hạt, hàm lượng dinh dưỡng sản phẩm mang đến cho những chú Poodle bộ lông mềm mượt,
                                    hệ thống miễn dịch tốt và sức khỏe dẻo dai.
                                </p>

                                <a href="#" class="card__button">Order</a>
                            </div>
                        </article>

                        <article class="card__article swiper-slide">
                            <div class="card__image">
                                <img src="./images/food-pet-2.png" alt="image" class="card__img">
                                <div class="card__shadow"></div>
                            </div>

                            <div class="card__data">
                                <h3 class="card__name">Food 4</h3>
                                <p class="card__description">
                                    Royal Canin Poodle Puppy là dòng thức ăn dành riêng cho chó Poodle con. 
                                    Với kiểu dáng hạt, hàm lượng dinh dưỡng sản phẩm mang đến cho những chú Poodle bộ lông mềm mượt,
                                    hệ thống miễn dịch tốt và sức khỏe dẻo dai.
                                </p>

                                <a href="#" class="card__button">Order</a>
                            </div>
                        </article>

                        <article class="card__article swiper-slide">
                            <div class="card__image">
                                <img src="./images/food-pet-5.png" alt="image" class="card__img">
                                <div class="card__shadow"></div>
                            </div>

                            <div class="card__data">
                                <h3 class="card__name">Food 5</h3>
                                <p class="card__description">
                                    Royal Canin Poodle Puppy là dòng thức ăn dành riêng cho chó Poodle con. 
                                    Với kiểu dáng hạt, hàm lượng dinh dưỡng sản phẩm mang đến cho những chú Poodle bộ lông mềm mượt,
                                    hệ thống miễn dịch tốt và sức khỏe dẻo dai.
                                </p>

                                <a href="#" class="card__button">Order</a>
                            </div>
                        </article>
                    </div>
                </div>
                <!-- Navigation buttons -->
                <div style="margin-right: 30px;color: black;" class="swiper-button-next">
                </div>       
                <div style="margin-left: 30px;color: black;" class="swiper-button-prev">
                </div>
                <!-- Pagination -->
                <div style="bottom: 4px;width: 100px;" class="swiper-pagination"></div>
            </div>
            <div class="newsletter" style= "background: url(images/img_for_home.jpg) no-repeat;">
                <form action="">
                    <h3>subscribe for latest update</h3>
                    <input type="email" name="" placeholder="enter your email" id="" class="box">
                    <input type="submit" value="subscribe" class="box2">
                </form>
            </div>
        </div>
        <!-- review section start here  -->
        <h2 style="font-family: cursive; text-align: center;font-size: 40px;margin-top: -45px;">review</h2>
        <div class="row review" id="review">   

            <div class="creater col-md-3">
                <p class="detail">
                    I am extremely satisfied with the service at this pet store! The staff is friendly and dedicated, they took the time to listen and understand my pet's needs. Additionally, the products are of high quality and diverse. I found the best food and toys for my pet. I feel reassured and confident when coming here, and I will definitely return for future shopping
                </p>
                <div class="clientDetailed">
                    <img class="img-fluid img-thumbnail" src="images/giang.jpg" alt="">
                    <div>
                        <h3>Truong Giang</h3>
                        <span>UI / UX designer</span>
                    </div>
                </div>
            </div>

            <div class="creater col-md-3">
                <p class="detail">
                    I want to share my fantastic experience at this pet store. The pet care service here is very professional and attentive. The staff provided detailed and easy-to-understand advice on my pet's nutrition and health. After using their grooming service, my pet became cleaner and more beautiful than ever. I truly appreciate the professionalism and quality of this store.
                </p>
                <div class="clientDetailed">
                    <img class="img-fluid img-thumbnail" src="images/tan.jpg" alt="">
                    <div>
                        <h3>Canh Tan</h3>
                        <span>UI / UX designer</span>
                    </div>
                </div>
            </div>

            <div class="creater col-md-3">
                <p class="detail">
                    I have found an amazing pet store! The service here truly exceeded my expectations. The staff is incredibly friendly and willing to assist. They introduced me to the most suitable products and services for my pet, and I feel confident in taking care of my pet on my own. Moreover, the store environment is comfortable and clean, creating a sense of peace for pets when they come
                </p>
                <div class="clientDetailed">
                    <img class="img-fluid img-thumbnail" src="images/tai.jpg" alt="">
                    <div>
                        <h3>Nhu Tai</h3>
                        <span>UI / UX designer</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- review section ends here  -->
        <!-- giỏ hàng -->
        <div class="container order_product">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="text-center" style="font-family: cursive;font-size: 40px;">List Product</h2>
                            </div>
                            <div class="card-body text-lg-start">
                                <table id="bootstrap-data-table"
                                       class="table table-hover table-striped table-bordered text-center fs-4 ">
                                    <thead>
                                    <th>Name Pet</th>
                                    <th>Type Pet</th>
                                    <th>Size</th>
                                    <th>Services</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                    </thead>
                                    <tbody id="data-body">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--=============== SWIPER JS ===============-->
        <script src="assets/js/swiper-bundle.min.js"></script>
        <!--=============== MAIN JS ===============-->
        <script src="assets/js/index.js"></script>
        <!--=============== ICON JS ===============-->
        <script src="https://kit.fontawesome.com/e6571b5821.js" crossorigin="anonymous"></script>
        <!--=============== LORDICON ===============-->
        <script src="https://cdn.lordicon.com/lordicon.js"></script>
    </body>
</html>
