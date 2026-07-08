import Router from "express";
import {
  createApartmentController,
  fetchApartmentController,
  loginApartmentController,
} from "./apartment.auth.controller.ts";

const router = Router();

router.post("/create", createApartmentController);
router.post("/login", loginApartmentController);
router.get("/profile", fetchApartmentController);

const apartmentRouter = router;
export default apartmentRouter;
