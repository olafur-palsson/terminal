
const MS_IN_DAY = 86400000
const MS_IN_HOUR = 3600000

const config = {
  // in 24 hour format
  start: 18,
  end: 6,
  transition: 1,
  green: '0.50',
  red: '0.8',
  blue: '0.35'
}

const isNightTime = hour => {
  const hourSinceStart = (hour + 24 - config.start) % 24
  const duractionOfNightTime = (config.start + 24 - config.end) % 24
  return hourSinceStart < duractionOfNightTime
}

const getHourOfDay = () => {
  let now = (new Date()).getTime()
  const msSinceMidnight = now % MS_IN_DAY
  const hour = msSinceMidnight / MS_IN_HOUR
  return Math.round(hour)
}

const getCommandString = () => {
  const nightTime = isNightTime(getHourOfDay())
  let applyIfNightTime = ratio => nightTime ? ratio : 1.0

  let { blue, green, red } = config
  blue = applyIfNightTime(blue)
  green = applyIfNightTime(green)
  red = applyIfNightTime(red)

  let command = 'xgamma '
  command += `-bgamma ${blue} `
  command += `-ggamma ${green} `
  command += `-rgamma ${red} `

  return command
}

console.log(getCommandString())
