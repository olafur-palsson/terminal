const fixYoutube = () => {
  const theater = document.getElementById('player-theater-container')
  theater.style.height = '100vh'
  theater.style.maxHeight = '100vh'

  const navbar = document.getElementById('masthead-container')
  navbar.style.display = 'none'

  const page = document.getElementById('page-manager')
  page.style.marginTop = 0
}

fixYoutube()
