<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ page import="model.*"%>
	<script type="text/javascript" src="javascript/jquery-2.0.0.min.js"></script>
	<script>
	//ไฟล์นี้ให้แก้บรรทัดที่ 10 11 12 13 196 200 -- ไฟล์ที่แก้  1.)โฟลเดอร์ javascript, 2.)booking.jsp, 3.)bookingfac.jsp
		var ticket="${param.ticket}";
		var type="${param.type}";
		var carno="${param.carno}";
		var date="${param.date}";
		console.log(type);
		var list = ticket.split(",");
		list.splice(list.length-1,1);
		var typeSelected;
		if(type=="1"){
			typeSelected = "seat";
		}else if(type=="2"){
			typeSelected = "bed";
		} 
		var selecteds = [];
		window.onload = function(){
			setImgSeat();
			setImgBed();
			document.getElementById("car").value=carno;
			document.getElementById("date").value=date;
		}
		
		function setImgSeat(){
			if(typeSelected!="seat"){
				document.getElementById("table1").style.display="none";
				return 0;
			}
			var table = document.getElementById('table1');
			var rows = table.getElementsByTagName("tr");
			for (var r = 0; r < rows.length; r++) {
				for (var c = 0; c < rows[r].cells.length; c++) {
					var numSeat = rows[r].cells[c].textContent;
					if(numSeat=="M" || numSeat==""){
						rows[r].cells[c].style.backgroundColor = "LemonChiffon";
						continue;
					}else if(numSeat=="T"){
						rows[r].cells[c].style.backgroundColor = "DodgerBlue";
						continue;
					}
					var check = 0;
					for (var i = 0; i < list.length; i++) {
						if(list[i]==numSeat){
							check = 1;
							break;
						}
					}
					if (check==0) {
						rows[r].cells[c].style.backgroundImage = 'url("img/s1.jpg")';
					}else{
						rows[r].cells[c].style.backgroundImage = 'url("img/s2.jpg")';
					}
				}
			}
		}
		
		function setImgBed(){
			if(typeSelected!="bed"){
				document.getElementById("table2").style.display="none";
				return 0;
			}
			var table = document.getElementById('table2');
			var rows = table.getElementsByTagName("tr");
			for(var r = 0 ; r < 3 ; r++){
				for(var c = 0 ; c < rows[r].cells.length ; c++){
					var numBed = rows[r].cells[c].textContent;
					if(numBed=="M" || numBed==""){
						rows[r].cells[c].style.backgroundColor = "LemonChiffon";
						continue;
					}else if(numBed=="T"){
						rows[r].cells[c].style.backgroundColor = "DodgerBlue";
						continue;
					}
					var check = 0;
					for (var i = 0; i < list.length; i++) {
						if(list[i]==numBed){
							check = 1;
							break;
						}
					}
					if(c%2==0){
						if(check==0){
							table.rows[r].cells[c].style.backgroundImage = 'url("img/bt1.jpg")';
						}else{
							table.rows[r].cells[c].style.backgroundImage = 'url("img/bt2.jpg")';
						}
					}else{
						if(check==0){
							table.rows[r].cells[c].style.backgroundImage = 'url("img/bb1.jpg")';
						}else{
							table.rows[r].cells[c].style.backgroundImage = 'url("img/bb2.jpg")';
						}
					}
				}
			}
		}
		
		function changeImageSeat(td){
				var numSeat = td.textContent;
				
				for(var i=0;i<list.length;i++){
					if(list[i]==numSeat){
						return 0;
					}
				}
				var check = 0;
				for(var i=0;i<selecteds.length;i++){
					if(selecteds[i]==numSeat){
						check = 1 ;
						selecteds.splice(i,1);
						break;
					}
				}
				if (selecteds.length>=4 && check==0) {
					return 0;
				}else if(check==0){
					selecteds.push(numSeat);
				}

				editText = "";
				for (var i = 0; i < selecteds.length; i++) {
					if(i==selecteds.length-1){
						editText += selecteds[i]
					}else{
						editText += selecteds[i]+",";
					}
				}
				document.getElementById("selected").value = editText;
				
				if(td.style.backgroundImage == 'url("img/s1.jpg")'){
					td.style.backgroundImage = 'url("img/s3.jpg")';
				}else if(td.style.backgroundImage == 'url("img/s3.jpg")'){
					td.style.backgroundImage = 'url("img/s1.jpg")';
				}
			}
			
		function changeImageBed(td){
				console.log(td.style.backgroundImage);
				var numBed = td.textContent;
				for(var i=0;i<list.length;i++){
					if(list[i]==numBed){
						return 0;
					}
				}
				var check = 0;
				for(var i=0;i<selecteds.length;i++){
					if(selecteds[i]==numBed){
						check = 1 ;
						selecteds.splice(i,1);
						break;
					}
				}
				if (selecteds.length>=4 && check==0) {
					return 0;
				}else if(check==0){
					selecteds.push(numBed);
				}

				editText = "";
				for (var i = 0; i < selecteds.length; i++) {
					if(i==selecteds.length-1){
						editText += selecteds[i]
					}else{
						editText += selecteds[i]+",";
					}
				}
				document.getElementById("selected").value = editText;
				
				if(td.style.backgroundImage == 'url("img/bb1.jpg")'){
					td.style.backgroundImage = 'url("img/bb3.jpg")';
				}else if(td.style.backgroundImage == 'url("img/bt1.jpg")'){
					td.style.backgroundImage = 'url("img/bt3.jpg")';
				}else if(td.style.backgroundImage == 'url("img/bb3.jpg")'){
					td.style.backgroundImage = 'url("img/bb1.jpg")'
				}else if(td.style.backgroundImage == 'url("img/bt3.jpg")'){
					td.style.backgroundImage = 'url("img/bt1.jpg")'
				}
				
				
			}
		
		
	</script>
	
	<table class="table table-striped table-bordered table-hover" border="1" style="border-collapse:collapse" id="table1" >
	    	<tr>
	       		<td align="center" width="30" height="30">M</td>
	          	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">2</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">6</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">10</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">14</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">18</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">22</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">26</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">30</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">34</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">36</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">42</td>
	           	<td align="center" width="30" height="30">M</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">46</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">50</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">54</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">58</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">62</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">66</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">70</td>
	           	
	           	<td align="center" width="30" height="30">M</td>
	           	<td align="center" width="30" height="30">M</td>
	           	<td align="center" width="30" height="30">T</td>
	           
	       </tr>
	       <tr>
	       		<td align="center" width="30" height="30">M</td>
	          	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">1</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">5</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">9</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">13</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">17</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">21</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">25</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">29</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">33</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">37</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">41</td>
	           	<td align="center" width="30" height="30">M</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">45</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">49</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">59</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">57</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">61</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">65</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">69</td>
	           	<td align="center" width="30" height="30">M</td>
	           	<td align="center" width="30" height="30">M</td>
	           	<td align="center" width="30" height="30">T</td>
	           
	       </tr>
	       <tr>
	       	<td colspan="23" height="30"></td>
	       </tr>
	       <tr>
	       		<td align="center" width="30" height="30">M</td>
	          	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">3</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">7</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">11</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">15</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">19</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">23</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">27</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">31</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">35</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">39</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">43</td>
	           	<td align="center" width="30" height="30">M</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">47</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">51</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">55</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">59</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">63</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">67</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">71</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">73</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">75</td>
	           	<td align="center" width="30" height="30">T</td>
	       </tr>
	       <tr>
	       		<td align="center" width="30" height="30">M</td>
	          	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">4</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">8</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">12</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">16</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">20</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">24</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">28</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">32</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">36</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">40</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">44</td>
	           	<td align="center" width="30" height="30">M</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">48</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">52</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">56</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">60</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">64</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">68</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">72</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">74</td>
	           	<td align="center" onclick="changeImageSeat(this)" width="30" height="30">76</td>
	           	<td align="center" width="30" height="30">T</td>
	       </tr>
	    </table>
	    
	    <br><br>
	    <div align="center">
	    <table border="1" style="border-collapse:collapse" id="table2" >
	    	<tr>
	       	<td align="center" width="30" height="30">M</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">1</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">2</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">5</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">6</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">9</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">10</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">13</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">14</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">17</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">18</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">21</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">22</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">25</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">26</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">29</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">30</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">33</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">34</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">37</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">38</td>
	           
	       </tr>
	       <tr>
	       	<td colspan="23" height="30"></td>
	       </tr>
	       <tr>
	       	<td align="center" onclick="changeImageBed(this)" width="30" height="30">M</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">3</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">4</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">7</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">8</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">11</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">12</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">15</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">16</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">19</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">20</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">23</td>
	           <td valign="bottom" onclick="changeImageBed(this)"  width="30" height="30">24</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">27</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">28</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">31</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">32</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">35</td>
	           <td valign="bottom" onclick="changeImageBed(this)" width="30" height="30">36</td>
	           <td valign="top" onclick="changeImageBed(this)" width="30" height="30">39</td>
	           <td valign="bottom" onclick="changeImageBed(this)"  width="30" height="30">40</td>
	       </tr>
	    </table>
	    </div>
	    <form method="get" action="booking" >
	    <input type="hidden" name="selected" id="selected" >
	    <input type="hidden" name="carno" id="car">
	    <input type="hidden" name="datebook" id="date">
	    <input type="hidden" name="action" value="insert">
	    <input class="btn btn-primary pull-right"type="submit">  
	    </form>
	    
	    
	    