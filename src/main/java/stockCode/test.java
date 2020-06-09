package stockCode;

public class test {
	public static void main(String[] args) {
		  for(var i=0; i<data.searchName.length; i++){
	          if(data.searchSangHa[i]=="up"){							
	            searchRank += "<th scope='row'><em>"+a+"</em>";
	          }
	          
	          else if(data.searchSangHa[i]=="down"){
	            searchRank += "<tr class='down'>";
	          }
	          else if(data.searchSangHa[i]=='0'){
	            searchRank += '<tr class="same">';
	          }
	          searchRank += '<th scope="row"><em>'+a+'</em>'
	          
	          searchRank += 	'<a href="/trade?stockName='+i+'">'+i+'</a></th>'
	          searchRank += '<td>'+data.searchCurrentPrice[i]+'</td>'
	            
	          if(data.searchSangHa[i]=="up"){
	            searchRank += '<td><em class="bu_p bu_pup2"><span class="blind">상한가</span></em>'
	            searchRank += 	'<span class="tah p11 red02">'+i+'</span></td>'
	          }
	                  
	          else if(data.searchSangHa[i]=="down"){
	            searchRank +=   '<td><em class="bu_p bu_pdn"><span class="blind">하락</span></em>'
	            searchRank +=     '<span class="tah p11 nv01">'+i+'</span></td>'
	          }
	          else if(data.searchSangHa[i]=='0'){
	            searchRank += '<td><span class="tah p11"> 0 </span></td>'
	          }
				
				
				searchRank += '</tr>'
			a++
	}
}
