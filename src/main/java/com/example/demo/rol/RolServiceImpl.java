package com.example.demo.rol;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class RolServiceImpl implements RolService{

    private final RolDAO rolDAO;

    public RolServiceImpl(RolDAO rolDAO) {
        this.rolDAO = rolDAO;
    }

    @Override
    public List<Rol> listaRoles() {
        return rolDAO.listaRoles();
    }
}
