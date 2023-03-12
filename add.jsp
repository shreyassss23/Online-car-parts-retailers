ry</a></li> 
<li><a href="logout.jsp">Logout</a></li> 
<a href="cart.jsp"><i class="fa fa-cart-plus fa-2x" aria-hidden="true"></i></a> 
</ul> 
<br> 
<form class="m-3" action="pay.jsp"> 
    <h3>Delivery Address</h3> 
    <input type="hidden" name="trans_id" value="<%=tid%>"> 
    <div class="form-row"> 
        <div class="form-group col-md-6"> 
            <label for="inputUser_id">Email</label> 
            <input type="text" class="form-control" id="inputEmail4" value="<%=a%>" name="uname"> 
        </div> 
        <div class="form-group col-md-6"> 
            <label for="inputMobile">Mobile</label> 
            <input type="text" class="form-control" id="inputMobno" name="mob" required> 
        </div> 
    </div> 
    <div class="form-group"> 
        <label for="inputAddress">Address</label> 
        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="add1"> 
    </div> 
    <div class="form-group"> 
        <label for="inputAddress2">Address 2</label> 
        <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor"> 
    </div> 
    <div class="form-row"> 
        <div class="form-group col-md-6"> 
            <label for="inputCity">City</label> 
            <input type="text" class="form-control" id="inputCity"> 
        </div> 
        <div class="form-group col-md-4"> 
            <label for="inputState">State</label> 
            <select id="inputState" class="form-control"> 
                <option selected>Choose...</option> 
                <option>Maharashtra</option> 
                <option>Delhi</option> 
                <option>Up</option> 
                <option>Gujarat</option> 
                <option>Karnataka</option> 
                <option>Punjab</option> 
                <option>Rajasthan</option> 
            </select> 
        </div> 
        <div class="form-group col-md-2"> 
            <label for="inputPin">Pin Code</label> 
            <input type="text" class="form-control" id="inputPin" placeholder="400 006"> 
        </div> 
    </div> 
    <button type="submit" class="btn btn-primary">Buy Now</button> 
</form> 
<footer> 
    <div class="footer1"> 
        <a href="#" style="font-weight: bold;font-size: 20px;text-decoration: none; color: white">About 
            us</a>&nbsp;&nbsp;&nbsp; 
        <a href="#" style="font-weight: bold;font-size: 20px;text-decoration: none; color:
           white">Contact</a>&nbsp;&nbsp;&nbsp; 
        <a href="#" style="font-weight: bold;font-size: 20px;text-decoration: none; color: white" 
           >Services</a>&nbsp;&nbsp;&nbsp; 
        <a href="#" style="font-weight: bold;font-size: 20px;text-decoration: none;color: white">Need 
            Help?</a>&nbsp;&nbsp;&nbsp; 

        <br> 

        <br> 

        <a href="#" class="fa fa-facebook" ></a> 
        <a href="#" class="fa fa-youtube"></a> 
        <a href="#" class="fa fa-instagram"></a> 
        <a href="#" class="fa fa-twitter"></a><br> 
        <a href="mailto:prasad@example.com" style="font-weight: bold;font-size: 20px;text-decoration:
           none;color: red">Sgcars@gmail.com</a></p> 
        <p style="font-weight: bold;font-size: 20px;text-decoration: none;color: blue">© Copyright 2021 -
            All Rights Reserved</p> 
    </div> 
</footer> 
</body> 
</html> 
</body> 
</html>