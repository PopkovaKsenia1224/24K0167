using HorizonSideRobots

function chess!(robot)
    step_Sud=do_upora!(robot, Sud)
    step_West=do_upora!(robot, West)
    n=step_Sud+step_West
    if n%2==0
        mark_direct!(robot, Ost)
    else 
        do_upora!(robot, Ost)
        mark_direct!(robot, West)
    end
    do_upora!(robot, Sud)
    do_upora!(robot, West)
    move!(robot, Nord, step_Sud)
    move!(robot, Ost, step_West)
end

function do_upora!(robot::Robot, send::HorizonSide)
    n::Int=0
    while !isborder(robot, send)
        move!(robot, send)
        n+=1
    end
    return n
end 

function mark_direct!(robot, side)
    while !isborder(robot, Nord)
        marker!(robot, side)
        side=inverse(side)
        move!(robot, Nord)
    end
    marker!(robot, side)
end

function marker!(robot, side)
    putmarker!(robot)
    while !isborder(robot, side)
        move!(robot, side)
        if !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end  
    end
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)          
    end
end