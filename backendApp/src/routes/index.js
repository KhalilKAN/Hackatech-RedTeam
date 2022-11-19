import { Router } from "express";
import {
  getPoints,
  postInstituciones,
  postObras,
  postRampas,
} from "../controller/index";

const router = Router();

router.get("/points", getPoints);
router.post("/instituciones", postInstituciones);
router.post("/obras", postObras);
router.post("/rampas", postRampas);

export default router;
