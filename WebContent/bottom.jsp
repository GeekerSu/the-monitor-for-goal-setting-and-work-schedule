<%@ taglib uri="/struts-tags" prefix="s" %>
    <%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <style type="text/css">
            html {
                position: relative;
                min-height: 100%;
            }
            
            body {
                margin-bottom: 200px;
            }
            
            .footer {
                color: #777;
                padding: 19px 0;
                background-color: rgba(41, 54, 89, 0.85);
                position: absolute;
                bottom: 0;
                width: 100%;
                height: 200px;
                font-family: "Microsoft YaHei", "Arial", "Times Roman", "Courier", "Verdana", "Century Gothic";
            }
        </style>


        <div class="footer">
            <div class="container" style="color: #A9A0A0">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <div class="row clearfix">
                            <div class="col-md-12 column">
                                <a href="#">关注我们</a>
                                <a href="#">联系我们</a>
                                
                                <br><hr style="height:1px;border:none;border-top:1px solid #555555;" /> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="bottom.jsp" %>