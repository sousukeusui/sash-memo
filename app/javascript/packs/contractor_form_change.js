window.onload = function(){
  let contractorName = document.getElementById('contractor_name')
  let searchResult = document.getElementById('search-result')
  
  if(contractorName){
    contractorName.addEventListener('keyup', searchContractor, false)
  }

  if(searchResult){
    searchResult.addEventListener('click', inputContractor, false)
  }

  function searchContractor(){
    $('#search-result li').remove()
    //フォーム中のテキストが空じゃないときは処理を実行
    if(contractorName.value !== ""){
      let contractor = contractorName.value
      $.ajax({
        type: 'GET',
        url: '/sites/search_contractor',
        data: {contractor: contractor},
        dataType: 'json'
      })
      .done(function(contractors){
        contractors.forEach(function(contractor){
          let li_ele = document.createElement('li')
          li_ele.setAttribute('class', 'contractor-list')
          li_ele.insertAdjacentText('beforeend',contractor.name)
          searchResult.appendChild(li_ele)
        })
      })
    }
  }

  function inputContractor(e){
    contractorName.value = e.target.innerText
    $('#search-result li').remove()
  }
}
