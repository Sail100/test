-- Credits to Render for the bypass.

local identity = (getidentity or syn and syn.getidentity or function() return 2 end)
local httpService = game:GetService('HttpService')
local setidentity = (setthreadcaps or syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end)
local oldcall
local list = {}
print('e')
local lplr = game.Players.LocalPlayer
shared.VapeExecuted = true
local rbxanalytics = game:GetService("RbxAnalyticsService")
local hwid = rbxanalytics:GetClientId()
local executor = (idenityexecutor and idenityexecutor() or getexecutename and getexecutename() or 'Unknown')
local httprequest = (http and http.request or http_request or fluxus and fluxus.request or request or function() end)

if hookmetamethod then
     oldcall = hookmetamethod(game, '__namecall', function(self, ...)
         if shared.VapeExecuted and self == httpService then
             local oldidentity = identity()
             setidentity(8)
             local res = oldcall(self, ...)
             setidentity(oldidentity)
             return res
         end
         return oldcall(self, ...)
     end)
 end

if hookmetamethod and httpServiceRun == nil then
local oldcall
getgenv().httpServiceRun = function(func, ...) return clonefunc(httpService[func])(httpService, ...) end
oldcall = hookmetamethod(httpService, '__namecall', function(self, ...)
    if self == httpService then
        return httpServiceRun(getnamecallmethod(), ...)
    end
    return oldcall(self, ...)
 end)
end

local hwids = game:HttpGet("https://sammz.pythonanywhere.com/velocity/b/v")
local decoded = httpService:JSONDecode(hwids)

for hwid, v in pairs(decoded) do
    table.insert(list, v)
end

local attempted = 1
for _, e in pairs(list) do
    if attempted == #list then
        newurl = "https://sammz.pythonanywhere.com/velocity/s/"..hwid.."/"..lplr.UserId
        s = httprequest({Url = newurl, method = 'GET'}).Body
        return
    else
        if e == hwid then
            lplr:Kick("Velocity is currently restricted for you.")
        else
            attempted = attempted + 1
        end
    end
end
