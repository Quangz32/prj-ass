<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Lugx Gaming Template - Contact Page</title>

        <%@include file="shared/stylesheet.jsp" %>

    </head>

    <body>

        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3>Contact Us</h3>
                        <span class="breadcrumb"><a href="#">Home</a>  >  Contact Us</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="contact-page section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 align-self-center">
                        <div class="left-text">
                            <div class="section-heading">
                                <h6>Contact Us</h6>
                                <h2>Say Hello!</h2>
                            </div>
                            <p>LUGX Gaming Template is based on the latest Bootstrap 5 CSS framework. This template is provided by TemplateMo and it is suitable for your gaming shop ecommerce websites. Feel free to use this for any purpose. Thank you.</p>
                            <ul>
                                <li><span>Address</span> Sunny Isles Beach, FL 33160, United States</li>
                                <li><span>Phone</span> +123 456 7890</li>
                                <li><span>Email</span> lugx@contact.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="right-content">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="map">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.5062169059406!2d105.52270890834278!3d21.01242168826357!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQ!5e0!3m2!1svi!2s!4v1708790540553!5m2!1svi!2s" width="100%" height="325px" style="border:0; border-radius: 23px" frameborder = "0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <form id="contact-form" action="" method="post">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <fieldset>
                                                    <input type="name" name="name" id="name" placeholder="Your Name..." autocomplete="on" required>
                                                </fieldset>
                                            </div>
                                            <div class="col-lg-6">
                                                <fieldset>
                                                    <input type="surname" name="surname" id="surname" placeholder="Your Surname..." autocomplete="on" required>
                                                </fieldset>
                                            </div>
                                            <div class="col-lg-6">
                                                <fieldset>
                                                    <input type="text" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your E-mail..." required="">
                                                </fieldset>
                                            </div>
                                            <div class="col-lg-6">
                                                <fieldset>
                                                    <input type="subject" name="subject" id="subject" placeholder="Subject..." autocomplete="on" >
                                                </fieldset>
                                            </div>
                                            <div class="col-lg-12">
                                                <fieldset>
                                                    <textarea name="message" id="message" placeholder="Your Message"></textarea>
                                                </fieldset>
                                            </div>
                                            <div class="col-lg-12">
                                                <fieldset>
                                                    <button type="submit" id="form-submit" class="orange-button">Send Message Now</button>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        
        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>
</html>