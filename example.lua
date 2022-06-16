--default fifo size is 512
local FIFO=require("FIFO")
--create a size of 1024 fifo
local queue1=FIFO:new(2)
--insert fifo 
queue1:ti("test")
queue1:ti("test")
--fifo full
queue1:ti("test")

--pop fifo 
local pop1=queue1:tr()
print(pop1)
print(queue1:tr())
