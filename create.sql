-- Create Tables
create table worker (
    gid int not null primary key,
    last_name char,
    first_name char
);

create table shift (
    sid char not null primary key,
    day_of_week char,
    start_time time,
    end_time time,
    term char,
    is_rotation char,
    gid int references worker
);

create table position (
    position_name char not null primary key,
    pay_rate decimal(6,2)
);

create table shift_type (
    sid char not null references shift,
    position_name char not null references position,
    primary key(sid, position_name)
);

create table works (
    position_name char not null references position,
    gid int not null references worker,
    primary key(position_name, gid)
);

create table parker_assigned (
    p_date date not null,
    start_time time not null,
    end_time time not null,
    gid int not null references worker,
    primary key(p_date, start_time, end_time, gid)
);

create table parker_shift (
    p_date date not null,
    start_time time not null,
    end_time time not null,
    number_required int,
    primary key(p_date, start_time, end_time)
);

create table rotation_assigned (
    sid char not null references shift,
    a_date date not null,
    gid int references worker,
    primary key(sid, a_date)
);

create table coverage (
    sid char not null references shift,
    c_date date not null,
    gid int references worker,
    mandatory char,
    primary key(sid, c_date)
);
