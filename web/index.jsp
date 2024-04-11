<%@include file="Head.jsp" %>
<!-- Page Content -->
<!-- Banner Starts Here -->
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <div class="owl-banner owl-carousel">
        <div class="banner-item-01">
            <div class="text-content">
                <h4>Welcome to PharmaMart</h4>
                <h2>Where Precision Meets Innovation!</h2>
            </div>
        </div>
        <div class="banner-item-02">
            <div class="text-content">
                <h4>Flash Deals</h4>
                <h2>Get your best products</h2>
            </div>
        </div>
        <div class="banner-item-03">
            <div class="text-content">
                <h4>Last Minute</h4>
                <h2>Grab last minute deals</h2>
            </div>
        </div>
    </div>
    <div class="col-lg-12" align="center">

        <br><br><br><br>
        <div class="row" id="result">

        <%
            String selProduct = "select * from tbl_product";
            ResultSet rsP = con.selectCommand(selProduct);
            while (rsP.next()) {
        %>

        <div class="col-md-3 mb-2" >
            <div class="card-deck" >
                <div class="card border-secondary" style="height: 500px">
                    <img src="Assets/Files/<%=rsP.getString("product_photo")%>" class="card-img-top" height="250">
                    <div class="card-img-secondary">
                        <h6  class="text-light bg-info text-center rounded p-1"><%=rsP.getString("product_name")%></h6>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title text-danger">
                            Rate : <%=rsP.getString("product_rate")%>/-<br>

                        </h4>
                      


                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>

</div>
<%@include file="Foot.jsp" %>