using HorizonSideRobots

function chess!(robot, n)
    step_West=do_upora!(robot, Ost)
    step_Sud=do_upora!(robot, Nord)
    a=do_upora!(robot, Sud)+1
    a=(a-(a%n))/n
    b=do_upora!(robot, West)+1
    b=(b-(b%n))/n
    mark_perimetr!(robot, a, b, n)
    do_upora!(robot, Ost)
    do_upora!(robot, Nord)
    move!(robot, West, step_West)
    move!(robot, Sud, step_Sud)
end

function mark_perimetr!(robot, a, b, n)
    b1=b
    while b1>0
        a1=a
        while a1>0
            mark_kletka!(robot, n)
            a1-=1
            if a1>0
                move!(robot, Nord, n)
                a1-=1
            end
        end
        a1=a
        b1-=1
        if b1>0
            move!(robot, Ost, n)
            do_upora!(robot, Sud)
            while a1>0
                move!(robot, Nord, n)
                a1-=1
                if a1>0
                    mark_kletka!(robot, n)
                    a1-=1
                end
            end
            b1-=1
        if b1>0
            move!(robot, Ost, n)
            do_upora!(robot, Sud)
        end
        end
    end
end

function mark_kletka!(robot, n)
    side=Ost
    for _ in 1:n
        for _ in 1:n-1             
            putmarker!(robot)
            move!(robot, side)
        end
        putmarker!(robot)
        move!(robot, Nord)
        side=inverse(side)
    end
    if n%2==1
        move!(robot, West, n-1)
    end
 end


