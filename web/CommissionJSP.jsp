<%-- 
    Document   : MainJSP
    Created on : Jan 25, 2024, 2:06:34 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Triangle Function</title>
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet"  href="styles/main_styles.css">
        <link rel="stylesheet" href="styles/scanner.css">
    </head>
    <body>
        <p class="${error==null ? " ": "alert-danger alert" }">${error}</p>
        <p class="${notChecked==null ? " ": "alert-danger alert" }">${notChecked}</p>
        <div class="terminal-loader">
            <div class="terminal-header">
                <div class="terminal-title">EIU</div>
                <div class="terminal-controls">
                    <div class="control close"></div>
                    <div class="control minimize"></div>
                    <div class="control maximize"></div>
                </div>
            </div>
            <div class="text">CSE 453</div>
        </div>
        <form class="form" action="CommissionServlet" method="post">
            <div style="display: table-caption">
                <div style="display: inline-flex">
                    <label style="margin-right: 5px" class="lb" for="nome">Min Lock</label>
                    <input style="width: 150px; margin-right: 10px" name="minlock" id="nome" type="number" class="infos" required min="1" max="60">

                    <label style="margin-right: 5px" class="lb" for="nome">Max Lock</label>
                    <input style="width: 150px; margin-right: 10px" name="maxlock" id="nome" type="number" class="infos" required min="1" max="60">
                </div>
                <div style="display: inline-flex">
                    <label style="margin-right: 5px" class="lb" for="nome">Min Stock</label>
                    <input style="width: 150px; margin-right: 10px" name="minstock" id="nome" type="number" class="infos" required min="1" max="70">

                    <label style="margin-right: 5px" class="lb" for="nome">Max Stock</label>
                    <input style="width: 150px; margin-right: 10px" name="maxstock" id="nome" type="number" class="infos" required min="1" max="70">
                </div>
                <div style="display: inline-flex">
                    <label style="margin-right: 5px" class="lb" for="nome">Min Barrel</label>
                    <input style="width: 150px; margin-right: 10px" name="minbarrel" id="nome" type="number" class="infos" required min="1" max="80">

                    <label style="margin-right: 5px" class="lb" for="nome">Max Barrel</label>
                    <input style="width: 150px; margin-right: 10px" name="maxbarrel" id="nome" type="number" class="infos" required min="1" max="80">
                </div> 
            </div>


            <br><br>
            <div style="display: grid; justify-content: center">
                <label for="data" class="lb">Type of Value Analysis</label>

                <div style="display: inline-flex; margin-top: 10px;">
                    <input name="checkbox" id="checkbox1" type="checkbox" class="infos" value="boundary" >
                    <label for="checkbox1" class="lb">Boundary</label><br>
                    <input name="checkbox" id="checkbox2" type="checkbox" class="infos" value="robust" style="margin-left: 30px">
                    <label for="checkbox2" class="lb">Robust</label><br>
                </div>
                <br><br>
                <div style="margin-left: 10px">
                    <button id="send" type="submit" style="margin-right: 15px">Send</button>
                    <button id="limpar"><a href="WelcomePage.jsp" style="color: lightcoral">Home</a></button>
                </div> 
            </div>

        </form>
        <c:if test="${error == null && notChecked == null}">
            <c:if test="${robustCommiss != null}">
                <div class="container">
                    <table class="table table-light" style="">
                        <thead>
                            <tr>
                                <th scope="col">Test case</th>
                                <th scope="col">A</th>
                                <th scope="col">B</th>
                                <th scope="col">C</th>
                                <th scope="col">Expected Commission</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>                            
                                <td>${minL}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify}</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>${minL+1}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify2}</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify3}</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>${maxL-1}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify4}</td>
                            </tr>

                            <tr>
                                <td>5</td>
                                <td>${maxL}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>                           
                                <td>$${classify5}</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>${nomL}</td>
                                <td>${minS}</td>
                                <td>${nomB}</td>
                                <td>$${classify6}</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>${nomL}</td>
                                <td>${minS+1}</td>
                                <td>${nomB}</td>
                                <td>$${classify7}</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify8}</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>${nomL}</td>
                                <td>${maxS-1}</td>
                                <td>${nomB}</td>
                                <td>$${classify9}</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>${nomL}</td>
                                <td>${maxS}</td>
                                <td>${nomB}</td>
                                <td>$${classify10}</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${minB}</td>
                                <td>$${classify11}</td>
                            </tr><tr>
                                <td>12</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${minB+1}</td>
                                <td>$${classify12}</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${maxB-1}</td>
                                <td>$${classify13}</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>${minL-1}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify14}</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>${maxL+1}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify15}</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>${nomL}</td>
                                <td>${minS-1}</td>
                                <td>${nomB}</td>
                                <td>$${classify16}</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>${nomL}</td>
                                <td>${maxS+1}</td>
                                <td>${nomB}</td>
                                <td>$${classify17}</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${minB-1}</td>
                                <td>$${classify18}</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${maxB+1}</td>
                                <td>$${classify19}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${boundaryCommiss != null}">
                <div class="container">
                    <table class="table table-light" style="">
                        <thead>
                            <tr>
                                <th scope="col">Test case</th>
                                <th scope="col">A</th>
                                <th scope="col">B</th>
                                <th scope="col">C</th>
                                <th scope="col">Expected Commission</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>                            
                                <td>${minL}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify}</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>${minL+1}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify2}</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify3}</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>${maxL-1}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify4}</td>
                            </tr>

                            <tr>
                                <td>5</td>
                                <td>${maxL}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>                           
                                <td>$${classify5}</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>${nomL}</td>
                                <td>${minS}</td>
                                <td>${nomB}</td>
                                <td>$${classify6}</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>${nomL}</td>
                                <td>${minS+1}</td>
                                <td>${nomB}</td>
                                <td>$${classify7}</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${nomB}</td>
                                <td>$${classify8}</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>${nomL}</td>
                                <td>${maxS-1}</td>
                                <td>${nomB}</td>
                                <td>$${classify9}</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>${nomL}</td>
                                <td>${maxS}</td>
                                <td>${nomB}</td>
                                <td>$${classify10}</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${minB}</td>
                                <td>$${classify11}</td>
                            </tr><tr>
                                <td>12</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${minB+1}</td>
                                <td>$${classify12}</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>${nomL}</td>
                                <td>${nomS}</td>
                                <td>${maxB-1}</td>
                                <td>$${classify13}</td>
                            </tr>
                        </tbody>
                    </table>
                </c:if></div>
            <div class="pyramid-loader">
                <div class="wrapper" style="margin-left:600px">
                    <span class="side side1"></span>
                    <span class="side side2"></span>
                    <span class="side side3"></span>
                    <span class="side side4"></span>
                    <span class="shadow"></span>
                </div>  
            </div>
        </c:if>
    </body>
</html>
