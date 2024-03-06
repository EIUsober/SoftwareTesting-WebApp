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
        <form class="form" action="MainControl" method="post">
            <label class="lb" for="nome">Minimum</label>
            <input name="min" id="nome" type="number" class="infos" required min="10" max="220">

            <label class="lb" for="nome">Maximum</label>
            <input name="max" id="nome" type="number" class="infos" style="margin-bottom: 40px" required min="10" max="220">
            <br><br><br>
            <label for="data" class="lb">Type of Value Analysis</label>

            <div style="display: inline-flex; margin-bottom: 0px; margin-top: 10px">
                <input name="checkbox" id="checkbox1" type="checkbox" class="infos" value="boundary">
                <label for="checkbox1" class="lb">Boundary</label><br>
                <input name="checkbox" id="checkbox2" type="checkbox" class="infos" value="robust" style="margin-left: 30px">
                <label for="checkbox2" class="lb">Robust</label><br>
            </div>
            <br><br><br><br>
            <div style="margin-left: 20px">
                <button id="send" type="submit" style="margin-right: 15px">Send</button>
                <button id="limpar"><a href="WelcomePage.jsp" style="color: lightcoral">Home</a></button>
            </div>
        </form>
        <c:if test="${error == null && min != null && alert == null && notChecked == null}">
            <c:if test="${boundaryTriangle != null}">
                <div class="container">
                    <table class="table table-light" style="text-align: center">
                        <thead>
                            <tr>
                                <th scope="col">Test case</th>
                                <th scope="col">A</th>
                                <th scope="col">B</th>
                                <th scope="col">C</th>
                                <th scope="col" style="max-width: 100px">Expected Output</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>                            
                                <td>${min}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${classify}</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>${min+1}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${classify2}</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${classify3}</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>${max-1}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${classify4}</td>
                            </tr>

                            <tr>
                                <td>5</td>
                                <td>${max}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>                           
                                <td>${classify5}</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>${nom}</td>
                                <td>${min}</td>
                                <td>${nom}</td>
                                <td>${classify6}</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>${nom}</td>
                                <td>${min+1}</td>
                                <td>${nom}</td>
                                <td>${classify7}</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>${nom}</td>
                                <td>${max-1}</td>
                                <td>${nom}</td>
                                <td>${classify8}</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>${nom}</td>
                                <td>${max}</td>
                                <td>${nom}</td>
                                <td>${classify9}</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${min}</td>
                                <td>${classify10}</td>
                            </tr><tr>
                                <td>11</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${min+1}</td>
                                <td>${classify11}</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${max-1}</td>
                                <td>${classify12}</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${max}</td>
                                <td>${classify13}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${robustTriangle != null}">
                <div class="container">
                    <table class="table table-light" style="">
                        <thead>
                            <tr>
                                <th scope="col">Test case</th>
                                <th scope="col">A</th>
                                <th scope="col">B</th>
                                <th scope="col">C</th>
                                <th scope="col">Expected Output</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>                            
                                <td>${min-1}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${classify}</td>
                            </tr>
                            <tr>
                                <td>2</td>                            
                                <td>${min}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${classify}</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>${min+1}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${classify2}</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${classify3}</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>${max-1}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${classify4}</td>
                            </tr>

                            <tr>
                                <td>6</td>
                                <td>${max}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>                           
                                <td>${classify5}</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>${max+1}</td>
                                <td>${nom}</td>
                                <td>${nom}</td>                           
                                <td>${classify5}</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>${nom}</td>
                                <td>${min-1}</td>
                                <td>${nom}</td>
                                <td>${classify6}</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>${nom}</td>
                                <td>${min}</td>
                                <td>${nom}</td>
                                <td>${classify6}</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>${nom}</td>
                                <td>${min+1}</td>
                                <td>${nom}</td>
                                <td>${classify7}</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>${nom}</td>
                                <td>${max-1}</td>
                                <td>${nom}</td>
                                <td>${classify9}</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>${nom}</td>
                                <td>${max}</td>
                                <td>${nom}</td>
                                <td>${classify10}</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>${nom}</td>
                                <td>${max+1}</td>
                                <td>${nom}</td>
                                <td>${classify10}</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${min-1}</td>
                                <td>${classify11}</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${min}</td>
                                <td>${classify11}</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${min+1}</td>
                                <td>${classify12}</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${max-1}</td>
                                <td>${classify14}</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${max}</td>
                                <td>${classify15}</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>${nom}</td>
                                <td>${nom}</td>
                                <td>${max+1}</td>
                                <td>${classify15}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </c:if>
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
