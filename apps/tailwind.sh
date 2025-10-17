function tw() {
    local tailwind_code=`node $PROJECTS/css-to-tailwind/main.js`
    echo "$tailwind_code"
    echo -n "$tailwind_code" | wl-copy
}
