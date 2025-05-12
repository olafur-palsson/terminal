swagger() {
  echo "Setting up swagger for $1"
  npm run --prefix ~/projects/swagger-ui start -- `realpath $1`
}
