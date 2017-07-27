local a = {1,2,3,4}
print(os.time())
function timeConvertDate( value )
    local year = os.date("%Y",value)
    local month = os.date("%m",value)
    local day = os.date("%d",value)
    if not year or not month or not day then
        return "0/0/0"
    end
    return year.."/"..month.."/"..day
end
print(timeConvertDate(os.time()))
-- local M = {"login","loginpanel","herolayer","loginpanel"}