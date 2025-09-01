function openapi-to-csmodels () {
    npx ts-node ~/projects/openapi-cs/generate-models.ts $1
}


function openapi-to-csmethods () {
    npx ts-node ~/projects/openapi-cs/generate-methods.ts $1
}
