package com.plub_kao.asset_it_support.repository;

import com.plub_kao.asset_it_support.entity.floor.FloorView;
import com.plub_kao.asset_it_support.entity.room.Room;
import com.plub_kao.asset_it_support.entity.room.RoomView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RoomRepository extends JpaRepository<Room, Integer> {

    @Query(value = """
            SELECT
                r.id,
                r.room_name
            FROM
                `room` r
            WHERE
                r.floor_id = :floorId;
            """, nativeQuery = true)
    List<RoomView> filterRoomByFloor(@Param("floorId") Integer Id);


}


