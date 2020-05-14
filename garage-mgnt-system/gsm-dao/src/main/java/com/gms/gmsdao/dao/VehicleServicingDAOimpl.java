package com.gms.gmsdao.dao;

import org.springframework.stereotype.Repository;

import com.gms.gmsdao.entities.VehicleService;
import com.gms.gmsdao.util.GmsGenericJpaDao;

@Repository
public class VehicleServicingDAOimpl extends GmsGenericJpaDao<VehicleService, Long> implements VehicleServicingDAO {

	public VehicleServicingDAOimpl() {
		super(VehicleService.class);
	}

}
