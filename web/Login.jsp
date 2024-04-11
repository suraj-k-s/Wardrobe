<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!doctype html>
    <html lang="en">
        <head>
            <title> pharma mart</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

            <link rel="stylesheet" href="Assets/Template/login/css/style.css">

        </head>
    <%
        if (request.getParameter("btn_login") != null) {
            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");

            String selQryA = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
            ResultSet rsA = con.selectCommand(selQryA);

            String selQryU = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
            ResultSet rsU = con.selectCommand(selQryU);

            String selQryW = "select * from tbl_weaver where weaver_email='" + email + "' and weaver_password='" + password + "'";
            ResultSet rsW = con.selectCommand(selQryW);

            String selQryT = "select * from tbl_tailor where tailor_email='" + email + "' and tailor_password='" + password + "'";
            ResultSet rsT = con.selectCommand(selQryT);

            if (rsA.next()) {
                session.setAttribute("aname", rsA.getString("admin_name"));
                session.setAttribute("aid", rsA.getString("admin_id"));
                response.sendRedirect("Admin/HomePage.jsp");
            } else if (rsU.next()) {
                session.setAttribute("uname", rsU.getString("user_name"));
                session.setAttribute("uid", rsU.getString("user_id"));
                response.sendRedirect("User/");
            } else if (rsW.next()) {
                if (rsW.getString("weaver_status").equals("1")) {
                    session.setAttribute("wname", rsW.getString("weaver_name"));
                    session.setAttribute("wid", rsW.getString("weaver_id"));
                    response.sendRedirect("weaver/");
                } else if (rsW.getString("weaver_status").equals("0")) {
    %>
    <script>
        alert("Verification Pending");
        window.location = "Login.jsp";
    </script>
    <%
    } else if (rsW.getString("weaver_status").equals("2")) {
    %>
    <script>
        alert("Sorry Your Account Has Been Blocked");
        window.location = "Login.jsp";
    </script>
    <%
        }
    } else if (rsT.next()) {
        if (rsT.getString("tailor_status").equals("1")) {
            session.setAttribute("tname", rsT.getString("tailor_name"));
            session.setAttribute("tid", rsT.getString("tailor_id"));
            response.sendRedirect("tailor/");
        } else if (rsW.getString("tailor_status").equals("0")) {
    %>
    <script>
        alert("Verification Pending");
        window.location = "Login.jsp";
    </script>
    <%
    } else if (rsT.getString("tailor_status").equals("2")) {
    %>
    <script>
        alert("Sorry Your Account Has Been Blocked");
        window.location = "Login.jsp";
    </script>
    <%
        }
    } else {
    %>
    <script>
        alert("Invalid Credentials");
        window.location = "Login.jsp";
    </script>
    <%
            }

        }
    %>
    <body style="background-image: url(Assets/Template/admin/img/icon/PexelsLogin.jpg);background-size: cover;background-repeat: no-repeat">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section"></h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                                <div class="text w-100">

                                    <h2>Welcome</h2><h2>To</h2><h2>PharmaMart</h2>
                                    <p>Don't have an account?</p>
                                    <a href="index.jsp" class="btn btn-white btn-outline-white">Sign Up</a>
                                </div>
                            </div>
                            <div class="login-wrap p-4 p-lg-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Sign In</h3>
                                    </div>
                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
                                        </p>
                                    </div>
                                </div>
                                <form action="#" class="signin-form" method="post">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Email</label>
                                        <input type="email" class="form-control" placeholder="Email" required name="txt_email">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Password</label>
                                        <input type="password" class="form-control" placeholder="Password" required name="txt_password">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" name="btn_login" class="form-control btn btn-primary submit px-3">Sign In</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>

        <script src="Assets/Template/login/js/jquery.min.js"></script>
        <script src="Assets/Template/login/js/popper.js"></script>
        <script src="Assets/Template/login/js/bootstrap.min.js"></script>
        <script src="Assets/Template/login/js/main.js"></script>

    </body>
</html>
<style>
    .text-wrap {
        background: rgb(147,34,195);
        background: linear-gradient(0deg, rgba(147,34,195,1) 0%, rgba(253,139,45,1) 100%);
    }
    .btn.btn-primary {

        background: rgb(147,34,195);
        background: linear-gradient(0deg, rgba(147,34,195,1) 0%, rgba(253,139,45,1) 100%);
    }    
</style>
