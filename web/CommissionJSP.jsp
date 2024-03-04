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

        <style>
            .pyramid-loader {
                position: relative;
                width: 300px;
                height: 300px;
                display: block;
                transform-style: preserve-3d;
                transform: rotateX(-20deg);
            }

            .wrapper {
                position: relative;
                width: 100%;
                height: 100%;
                transform-style: preserve-3d;
                animation: spin 4s linear infinite;
            }

            @keyframes spin {
                100% {
                    transform: rotateY(360deg);
                }
            }

            .pyramid-loader .wrapper .side {
                width: 70px;
                height: 70px;
                /* you can choose any gradient or color you want */
                /* background: radial-gradient( #2F2585 10%, #F028FD 70%, #2BDEAC 120%); */
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                margin: auto;
                transform-origin: center top;
                clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
            }

            .pyramid-loader .wrapper .side1 {
                transform: rotateZ(-30deg) rotateY(90deg);
                background: conic-gradient( #2BDEAC, #F028FD, #D8CCE6, #2F2585);
            }

            .pyramid-loader .wrapper .side2 {
                transform: rotateZ(30deg) rotateY(90deg);
                background: conic-gradient( #2F2585, #D8CCE6, #F028FD, #2BDEAC);
            }

            .pyramid-loader .wrapper .side3 {
                transform: rotateX(30deg);
                background: conic-gradient( #2F2585, #D8CCE6, #F028FD, #2BDEAC);
            }

            .pyramid-loader .wrapper .side4 {
                transform: rotateX(-30deg);
                background: conic-gradient( #2BDEAC, #F028FD, #D8CCE6, #2F2585);
            }

            .pyramid-loader .wrapper .shadow {
                width: 60px;
                height: 60px;
                background: #8B5AD5;
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                margin: auto;
                transform: rotateX(90deg) translateZ(-40px);
                filter: blur(12px);
            }
            body {
                width: 100%;
                height: 100%;
                --color: rgba(114, 114, 114, 0.3);
                background-color: #191a1a;
                background-image: linear-gradient(0deg, transparent 24%, var(--color) 25%, var(--color) 26%, transparent 27%,transparent 74%, var(--color) 75%, var(--color) 76%, transparent 77%,transparent),
                    linear-gradient(90deg, transparent 24%, var(--color) 25%, var(--color) 26%, transparent 27%,transparent 74%, var(--color) 75%, var(--color) 76%, transparent 77%,transparent);
                background-size: 55px 55px;
            }
            form {
                background-color: #444444;
                border-radius: 10px;
                padding: 20px;
                width: 500px;
                margin: 50px auto;
                color: lightgray;
                height: 500px;
            }

            .lb {
                display: block;
                font-size: 18px;
                font-weight: bold;
            }

            .infos[type="number"], input[type="email"], input[type="date"] {
                width: 90%;
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                border: none;
                margin-bottom: 20px;
                background-color: #333333;
                color: white;
            }

            #send {
                --glow-color: rgb(176, 255, 189);
                --glow-spread-color: rgba(123, 255, 160, 0.781);
                --enhanced-glow-color: rgb(182, 175, 71);
                --btn-color: rgba(13, 241, 21, 0.508);
                border: .25em solid var(--glow-color);
                padding: 1em 2em;
                color: var(--glow-color);
                font-size: 14px;
                font-weight: bold;
                background-color: var(--btn-color);
                border-radius: 1em;
                outline: none;
                box-shadow: 0 0 1em .25em var(--glow-color),
                    0 0 4em 1em var(--glow-spread-color),
                    inset 0 0 .05em .25em var(--glow-color);
                text-shadow: 0 0 .5em var(--glow-color);
                position: relative;
                transition: all 0.3s;
            }

            #send::after {
                pointer-events: none;
                content: "";
                position: absolute;
                top: 120%;
                left: 0;
                height: 100%;
                width: 100%;
                background-color: var(--glow-spread-color);
                filter: blur(2em);
                opacity: .7;
                transform: perspective(1.5em) rotateX(35deg) scale(1, .6);
            }

            #send:hover {
                color: var(--btn-color);
                background-color: var(--glow-color);
                box-shadow: 0 0 1em .25em var(--glow-color),
                    0 0 4em 2em var(--glow-spread-color),
                    inset 0 0 .75em .25em var(--glow-color);
            }

            #send:active {
                box-shadow: 0 0 0.6em .25em var(--glow-color),
                    0 0 2.5em 2em var(--glow-spread-color),
                    inset 0 0 .5em .25em var(--glow-color);
            }

            #limpar {
                --glow-color: rgb(255, 176, 176);
                --glow-spread-color: rgba(255, 123, 123, 0.781);
                --enhanced-glow-color: rgb(182, 175, 71);
                --btn-color: rgba(241, 13, 13, 0.508);
                border: .25em solid var(--glow-color);
                padding: 1em 2em;
                color: var(--glow-color);
                font-size: 14px;
                font-weight: bold;
                background-color: var(--btn-color);
                border-radius: 1em;
                outline: none;
                box-shadow: 0 0 1em .25em var(--glow-color),
                    0 0 4em 1em var(--glow-spread-color),
                    inset 0 0 .05em .25em var(--glow-color);
                text-shadow: 0 0 .5em var(--glow-color);
                position: relative;
                transition: all 0.3s;
            }

            #limpar::after {
                pointer-events: none;
                content: "";
                position: absolute;
                top: 120%;
                left: 0;
                height: 100%;
                width: 100%;
                background-color: var(--glow-spread-color);
                filter: blur(2em);
                opacity: .7;
                transform: perspective(1.5em) rotateX(35deg) scale(1, .6);
            }

            #limpar:hover {
                color: var(--btn-color);
                background-color: var(--glow-color);
                box-shadow: 0 0 1em .25em var(--glow-color),
                    0 0 4em 2em var(--glow-spread-color),
                    inset 0 0 .75em .25em var(--glow-color);
            }

            #limpar:active {
                box-shadow: 0 0 0.6em .25em var(--glow-color),
                    0 0 2.5em 2em var(--glow-spread-color),
                    inset 0 0 .5em .25em var(--glow-color);
            }
            @keyframes blinkCursor {
                50% {
                    border-right-color: transparent;
                }
            }

            @keyframes typeAndDelete {
                0%,
                10% {
                    width: 0;
                }
                45%,
                55% {
                    width: 6.2em;
                } /* adjust width based on content */
                90%,
                100% {
                    width: 0;
                }
            }

            .terminal-loader {
                border: 0.1em solid #333;
                background-color: white;
                color: black;
                font-family: "Courier New", Courier, monospace;
                font-size: 1.5em;
                padding: 1.5em 1em;
                width: 12em;
                margin:0px 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 4px;
                position: absolute;
                overflow: hidden;
                box-sizing: border-box;
            }

            .terminal-header {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 1.5em;
                background-color: #333;
                border-top-left-radius: 4px;
                border-top-right-radius: 4px;
                padding: 0 0.4em;
                box-sizing: border-box;
            }

            .terminal-controls {
                float: right;
            }

            .control {
                display: inline-block;
                width: 0.6em;
                height: 0.6em;
                margin-left: 0.4em;
                border-radius: 50%;
                background-color: #777;
            }

            .control.close {
                background-color: #e33;
            }

            .control.minimize {
                background-color: #ee0;
            }

            .control.maximize {
                background-color: #0b0;
            }

            .terminal-title {
                float: left;
                line-height: 1.5em;
                color: #eee;
            }

            .text {
                display: inline-block;
                white-space: nowrap;
                overflow: hidden;
                border-right: 0.2em solid green; /* Cursor */
                animation: typeAndDelete 4s steps(11) infinite,
                    blinkCursor 0.5s step-end infinite alternate;
                margin-top: 1.5em;
                font-weight: bold;
            }


        </style>
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
