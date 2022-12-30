<%-- 
    Document   : index
    Created on : Jul 29, 2022, 6:54:20 PM
    Author     : ldanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <jsp:include page="include/user/css-page.jsp" />
    </head>
    <body>
        <jsp:include page="include/user/menu.jsp"/>

        <div class="super_container">
            <jsp:include page="include/user/header.jsp"/>
            <div class="super_container_inner">
                <div class="super_overlay"></div>
                <!-- slider -->
                <div class="home">
                    <!-- Home Slider -->
                    <div class="home_slider_container">
                        <div class="owl-carousel owl-theme home_slider">

                            <!-- Slide -->
                            <div class="owl-item">
                                <div class="background_image" style="background-image:url(<c:url value="/resources/images/home.jpg"/>)"></div>
                                <div class="container fill_height">
                                    <div class="row fill_height">
                                        <div class="col fill_height">
                                            <div class="home_container d-flex flex-column align-items-center justify-content-start">
                                                <div class="home_content">
                                                    <div class="home_title">New Arrivals</div>
                                                    <div class="home_subtitle">Summer Wear</div>
                                                    <div class="home_items">
                                                        <div class="row">
                                                            <div class="col-sm-3 offset-lg-1">
                                                                <div class="home_item_side"><a href="product.html"><img src="<c:url value="/resources/images/home_1.jpg"/>" alt=""></a></div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-8 offset-sm-2 offset-md-0">
                                                                <div class="product home_item_large">
                                                                    <div class="product_tag d-flex flex-column align-items-center justify-content-center">
                                                                        <div>
                                                                            <div>from</div>
                                                                            <div>$3<span>.99</span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_image"><img src="<c:url value="/resources/images/home_2.jpg"/>" alt=""></div>
                                                                    <div class="product_content">
                                                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                                            <div>
                                                                                <div>
                                                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ml-auto text-right">
                                                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                                                <div class="product_price text-right">$3<span>.99</span></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product_buttons">
                                                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div><div><img src="<c:url value="/resources/images/heart.svg"/>" alt=""><div>+</div></div></div>
                                                                                </div>
                                                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div><div><img src="<c:url value="/resources/images/cart_2.svg"/>" alt=""><div>+</div></div></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="home_item_side"><a href="product.html"><img src="<c:url value="/resources/images/home_3.jpg"/>" alt=""></a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>	
                            </div>

                            <!-- Slide -->
                            <div class="owl-item">
                                <div class="background_image" style="background-image:url(<c:url value="/resources/images/home.jpg"/>)"></div>
                                <div class="container fill_height">
                                    <div class="row fill_height">
                                        <div class="col fill_height">
                                            <div class="home_container d-flex flex-column align-items-center justify-content-start">
                                                <div class="home_content">
                                                    <div class="home_title">Popular</div>
                                                    <div class="home_subtitle">Summer Wear</div>
                                                    <div class="home_items">
                                                        <div class="row">
                                                            <div class="col-sm-3 offset-lg-1">
                                                                <div class="home_item_side"><a href="product.html"><img src="<c:url value="/resources/images/home_1.jpg"/>" alt=""></a></div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-8 offset-sm-2 offset-md-0">
                                                                <div class="product home_item_large">
                                                                    <div class="product_tag d-flex flex-column align-items-center justify-content-center">
                                                                        <div>
                                                                            <div>from</div>
                                                                            <div>$3<span>.99</span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_image"><img src="<c:url value="/resources/images/product_1.jpg"/> alt=""></div>
                                                                    <div class="product_content">
                                                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                                            <div>
                                                                                <div>
                                                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ml-auto text-right">
                                                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                                                <div class="product_price text-right">$3<span>.99</span></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product_buttons">
                                                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div><div><img src="<c:url value="/resources/images/heart.svg"/>" alt=""><div>+</div></div></div>
                                                                                </div>
                                                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div><div><img src="<c:url value="/resources/images/cart_2.svg"/>" alt=""><div>+</div></div></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="home_item_side"><a href="product.html"><img src="<c:url value="/resources/images/home_3.jpg"/>" alt=""></a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>	
                            </div>

                            <!-- Slide -->
                            <div class="owl-item">
                                <div class="background_image" style="background-image:url(<c:url value="/resources/images/home.jpg"/>)"></div>
                                <div class="container fill_height">
                                    <div class="row fill_height">
                                        <div class="col fill_height">
                                            <div class="home_container d-flex flex-column align-items-center justify-content-start">
                                                <div class="home_content">
                                                    <div class="home_title">Trendsetters</div>
                                                    <div class="home_subtitle">Summer Wear</div>
                                                    <div class="home_items">
                                                        <div class="row">
                                                            <div class="col-sm-3 offset-lg-1">
                                                                <div class="home_item_side"><a href="product.html"><img src="<c:url value="/resources/images/home_1.jpg"/>" alt=""></a></div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-8 offset-sm-2 offset-md-0">
                                                                <div class="product home_item_large">
                                                                    <div class="product_tag d-flex flex-column align-items-center justify-content-center">
                                                                        <div>
                                                                            <div>from</div>
                                                                            <div>$3<span>.99</span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_image"><img src="<c:url value="/resources/images/product_2.jpg"/>" alt=""></div>
                                                                    <div class="product_content">
                                                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                                            <div>
                                                                                <div>
                                                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ml-auto text-right">
                                                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                                                <div class="product_price text-right">$3<span>.99</span></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product_buttons">
                                                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div><div><img src="<c:url value="/resources/images/heart.svg"/>" alt=""><div>+</div></div></div>
                                                                                </div>
                                                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div><div><img src="<c:url value="/resources/images/cart_2.svg"/>" alt=""><div>+</div></div></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="home_item_side"><a href="product.html"><img src="<c:url value="/resources/images/home_3.jpg"/>" alt=""></a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>	
                            </div>

                            <!-- Slide -->
                            <div class="owl-item">
                                <div class="background_image" style="background-image:url(<c:url value="/resources/images/home.jpg"/>)"></div>
                                <div class="container fill_height">
                                    <div class="row fill_height">
                                        <div class="col fill_height">
                                            <div class="home_container d-flex flex-column align-items-center justify-content-start">
                                                <div class="home_content">
                                                    <div class="home_title">Premium Items</div>
                                                    <div class="home_subtitle">Summer Wear</div>
                                                    <div class="home_items">
                                                        <div class="row">
                                                            <div class="col-sm-3 offset-lg-1">
                                                                <div class="home_item_side"><a href="product.html"><img src="<c:url value="/resources/images/home_1.jpg"/>" alt=""></a></div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-8 offset-sm-2 offset-md-0">
                                                                <div class="product home_item_large">
                                                                    <div class="product_tag d-flex flex-column align-items-center justify-content-center">
                                                                        <div>
                                                                            <div>from</div>
                                                                            <div>$3<span>.99</span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_image"><img src="<c:url value="/resources/images/product_3.jpg"/>" alt=""></div>
                                                                    <div class="product_content">
                                                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                                            <div>
                                                                                <div>
                                                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ml-auto text-right">
                                                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                                                <div class="product_price text-right">$3<span>.99</span></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product_buttons">
                                                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div><div><img src="<c:url value="/resources/images/heart.svg"/>" alt=""><div>+</div></div></div>
                                                                                </div>
                                                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div><div><img src="<c:url value="/resources/images/cart_2.svg"/>" alt=""><div>+</div></div></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="home_item_side"><a href="product.html"><img src="<c:url value="/resources/images/home_3.jpg"/>" alt=""></a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>	
                            </div>

                        </div>
                        <div class="home_slider_nav home_slider_nav_prev"><i class="fa fa-chevron-left" aria-hidden="true"></i></div>
                        <div class="home_slider_nav home_slider_nav_next"><i class="fa fa-chevron-right" aria-hidden="true"></i></div>

                        <!-- Home Slider Dots -->

                        <div class="home_slider_dots_container">
                            <div class="container">
                                <div class="row">
                                    <div class="col">
                                        <div class="home_slider_dots">
                                            <ul id="home_slider_custom_dots" class="home_slider_custom_dots d-flex flex-row align-items-center justify-content-center">
                                                <li class="home_slider_custom_dot active">01</li>
                                                <li class="home_slider_custom_dot">02</li>
                                                <li class="home_slider_custom_dot">03</li>
                                                <li class="home_slider_custom_dot">04</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>	
                        </div>

                    </div>
                </div>

                <!-- Products -->

                <div class="products">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-3">
                                <div class="section_title text-center">Popular on Little Closet</div>
                            </div>
                        </div>
                        <div class="row page_nav_row">
                            <div class="col">
                                <div class="page_nav">
                                    <ul class="d-flex flex-row align-items-start justify-content-center">
                                        <li class="active"><a href="category.html">Women</a></li>
                                        <li><a href="category.html">Men</a></li>
                                        <li><a href="category.html">Kids</a></li>
                                        <li><a href="category.html">Home Deco</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row products_row">

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image"><img src="<c:url value="/resources/images/product_1.jpg"/>" alt=""></div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/heart_2.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/cart.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image"><img src="<c:url value="/resources/images/product_2.jpg"/>" alt=""></div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/heart_2.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/cart.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image"><img src="<c:url value="/resources/images/product_3.jpg"/>" alt=""></div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/heart_2.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/cart.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image"><img src="<c:url value="/resources/images/product_4.jpg"/>" alt=""></div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/heart_2.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/cart.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image"><img src="<c:url value="/resources/images/product_5.jpg"/>" alt=""></div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/heart_2.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/cart.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image"><img src="<c:url value="/resources/images/product_6.jpg"/>" alt=""></div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/heart_2.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div><div><img src="<c:url value="/resources/images/cart.svg"/>" class="svg" alt=""><div>+</div></div></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row load_more_row">
                            <div class="col">
                                <div class="button load_more ml-auto mr-auto"><a href="#">load more</a></div>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="include/user/footer-page.jsp"/>
            </div>
        </div>

        <jsp:include page="include/user/js-page.jsp"/>
    </body>
</html>
