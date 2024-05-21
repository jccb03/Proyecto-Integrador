<%--
  Created by IntelliJ IDEA.
  User: pdl-1
  Date: 21/5/2024
  Time: 5:14 p. m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>
</head>
<body>
<div class="reservation-form">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form id="reservation-form" name="gs" method="submit" role="search" action="#">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4>Login</h4>
                        </div>
                        <div class="col-lg-6">
                            <fieldset>
                                <label for="Name" class="form-label">Your Name</label>
                                <input type="text" name="Name" class="Name" placeholder="Ex. John Smithee" autocomplete="on" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-6">
                            <fieldset>
                                <label for="Number" class="form-label">Your Phone Number</label>
                                <input type="text" name="Number" class="Number" placeholder="Ex. +xxx xxx xxx" autocomplete="on" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-6">
                            <fieldset>
                                <label for="chooseGuests" class="form-label">Number Of Guests</label>
                                <select name="Guests" class="form-select" aria-label="Default select example" id="chooseGuests" onChange="this.form.click()">
                                    <option selected>ex. 3 or 4 or 5</option>
                                    <option type="checkbox" name="option1" value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4+">4+</option>
                                </select>
                            </fieldset>
                        </div>
                        <div class="col-lg-6">
                            <fieldset>
                                <label for="Number" class="form-label">Check In Date</label>
                                <input type="date" name="date" class="date" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-12">
                            <fieldset>
                                <label for="chooseDestination" class="form-label">Choose Your Destination</label>
                                <select name="Destination" class="form-select" aria-label="Default select example" id="chooseCategory" onChange="this.form.click()">
                                    <option selected>ex. Switzerland, Lausanne</option>
                                    <option value="Italy, Roma">Italy, Roma</option>
                                    <option value="France, Paris">France, Paris</option>
                                    <option value="Engaland, London">Engaland, London</option>
                                    <option value="Switzerland, Lausanne">Switzerland, Lausanne</option>
                                </select>
                            </fieldset>
                        </div>
                        <div class="col-lg-12">
                            <fieldset>
                                <button class="main-button">Make Your Reservation Now</button>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>