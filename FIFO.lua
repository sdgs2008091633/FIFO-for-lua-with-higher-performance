--FIFO
--n:insert count,r:remove count,m:maxcache size,c: collectgarbage count
 
local _Q={n=0,r=0,m=512,c=65535}
--create queue
function _Q:new(m,c)
    local o=o or {}
	o.m=tonumber(m) or _Q.m
	o.c=tonumber(c) or _Q.c
	setmetatable(o,self)
	self.__index=self
	return o
end
--auto reset count
function _Q:clear()
local m=self.m
for k,v in pairs(self) do 
self[k]=nil
end
self.n=0
self.r=0
self.m=m
end

--auto Garbage Collection
function _Q:gc()
self[self.r]=nil
if self.n<self.c or self.r<self.c then return end
if self.r==self.n then
return self:clear()
end
end

--in
function _Q:ti(i)
if not i then return  end
if   self.n-self.r >= self.m then print("buffer is full") return  end
self.n=self.n+1
self.c=self.c+1
self[self.n]=i
end

--pop out
function _Q:tr()
	if self.r==self.n then return end
	if self.n>self.r then 
		self.r=self.r+1
	return self[self.r],self:gc()
	end
end

return _Q
