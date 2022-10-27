
function Components.Custom.Clock:PadTwoDigits(num)
    if num > 9 then return tostring(num) end
    return "0" .. tostring(num)
end

function Components.Custom.Clock:GetTimeStr()
  DSEC=24*60*60
  YSEC=365*DSEC
  LSEC=YSEC+DSEC
  FSEC=4*YSEC+DSEC
  BASE_DOW=4
  BASE_YEAR=1970
  
  _days={
      -1, 30, 58, 89, 119, 150, 180, 211, 242, 272, 303, 333, 364
  }
  _lpdays={}
  for i=1,2  do _lpdays[i]=_days[i]   end
  for i=3,13 do _lpdays[i]=_days[i]+1 end
  
  function floor(x)
      return x + ((-x) % 1) - 1
  end
  
  if App.Data.Var.Start == nil or App.Data.Var.Start == 0 then
    App.Data.Var.Start = 1666766802
  end

  local iclock = timer.getMilliSecCounter()
  local t = floor(iclock / 1000) + App.Data.Var.Start
  local offset = 0
  local isDaylight = true
  local y,j,m,d,w,h,n,s
  local mdays=_days
  if isDaylight then offset=offset+1 end
  s=t+(offset*60*60)
  y=floor(s/FSEC)
  s=s-y*FSEC
  y=y*4+BASE_YEAR
  if s>=YSEC then
      y=y+1
      s=s-YSEC
      if s>=YSEC then
          y=y+1
          s=s-YSEC
          if s>=LSEC then
              y=y+1
              s=s-LSEC
          else
              mdays=_lpdays
          end
      end
  end
  j=floor(s/DSEC)
  s=s-j*DSEC
  local m=1
  while mdays[m]<j do m=m+1 end
  m=m-1
  local d=j-mdays[m]
  w=(floor(t/DSEC)+BASE_DOW)%7
  h=floor(s/3600)
  s=s-h*3600
  n=floor(s/60)
  s=s-n*60
  return self:PadTwoDigits(d) .. "." .. self:PadTwoDigits(m) .. "." .. y .. " " .. self:PadTwoDigits(h) .. ":" .. self:PadTwoDigits(n) .. ":" .. self:PadTwoDigits(s), iclock
end

App:AddElement(Components.Custom.Clock:new())
App:AddElement(Components.Custom.EditModeIndicator:new())
App:AddElement(Components.Custom.DevNote:new())

App.Gui.DarkMode = true
