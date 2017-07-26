vid = videoinput('winvideo', 1, 'MJPG_640x480');
src = getselectedsource(vid);

vid.FramesPerTrigger = 1;

triggerconfig(vid, 'manual');

    start(vid);
    [y,Fs] = audioread('snare.ogg');
    [x,Fs] = audioread('crash1_1.ogg');
    [z,Fs] = audioread('splash.ogg');
    [w,Fs] = audioread('ride1.ogg');
    



    
for index=1:2500
  
    a=getsnapshot(vid);
    k=0;
    m=0;
    n=0;
    o=0;
    for row = 1:200
        for col = 1:200
            if a(row,col,1)>125 && a(row,col,2)<100 && a(row,col,3)<100
                k=k+1;
            end
            a(row,col,3)=25;
        end
    end
    
     for row = 1:200
        for col = 440:640
            if a(row,col,1)>125 && a(row,col,2)<100 && a(row,col,3)<100
                n=n+1;
            end
            a(row,col,3)=255;
        end
     end
     for row = 280:480
        for col = 1:200
            if a(row,col,1)>125 && a(row,col,2)<100 && a(row,col,3)<100
                o=o+1;
            end
            a(row,col,2)=25;
        end
    end
   for row =280:480
        for col =440:640
            if a(row,col,1)>125 && a(row,col,2)<100 && a(row,col,3)<100
                m=m+1;
            end
           a(row,col,2)=255;  
        end
    end
    if k>500
        sound(y,Fs);
    end
    if m>500
        sound(x,Fs);
    end
    if n>500
        sound(z,Fs);
     
    end
    if o>500
        sound(w,Fs);
    end
    imshow(a);
    
    
    
end
   stop(vid);
