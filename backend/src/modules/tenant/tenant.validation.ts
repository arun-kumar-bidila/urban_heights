import Joi from "joi";

export const createTenantSchema = Joi.object({
  fullName: Joi.string().trim().required().messages({
    "string.empty": "fullName is required",
    "any.required": "fullName is required",
  }),
  mobile: Joi.string().trim().required().messages({
    "string.empty": "mobile is required",
    "any.required": "mobile is required",
  }),
  email: Joi.string().required().messages({
    "string.empty": "email is required",
    "any.required": "email is required",
  }),
  roomNumber: Joi.string().required().messages({
    "string.empty": "roomNumber is required",
    "any.required": "roomNumber is required",
  }),
  roomType: Joi.string().required().messages({
    "string.empty": "roomType is required",
    "any.required": "roomType is required",
  }),
  apartmentName: Joi.string().required().messages({
    "string.empty": "apartmentName is required",
    "any.required": "apartmentName is required",
  }),
  roomId: Joi.string().required().messages({
    "string.empty": "roomId is required",
    "any.required": "roomId is required",
  }),
}).strict();

export const loginTenantSchema = Joi.object({
  email: Joi.string().trim().required().messages({
    "string.empty": "email is required",
    "any.required": "email is required",
  }),
  password: Joi.string().trim().required().messages({
    "string.empty": "password is required",
    "any.required": "password is required",
  }),
}).strict();
