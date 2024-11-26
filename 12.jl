
function top(robot)
    k=0
    side=Ost
    while !isborder(robot, Nord)
        f=0
        while !isborder(robot, side)
            if isborder(robot, Nord) && f==0 
                k+=1
                f=1
            elseif isborder(robot, Nord) && f==10 

                f=1
            elseif !isborder(robot, Nord) && f==10
                f=0
            elseif !isborder(robot, Nord) && f==1
                f=10
            end
            move!(robot, side)
        end
        side=inverse(side)
        move!(robot, Nord)
    end
    return k
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)