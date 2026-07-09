import Joi from "joi";

export const createApartmentSchema = Joi.object({
  apartmentName: Joi.string().trim().min(2).required().messages({
    "string.min": "Name must be at least 2 characters",
    "string.empty": "Name is required",
    "any.required": "Name is required",
  }),

  address: Joi.string().trim().min(2).required().messages({
    "string.min": "Address must be at least 2 characters",
    "string.empty": "Address is required",
    "any.required": "Address is required",
  }),
  ownerName: Joi.string().trim().min(2).required().messages({
    "string.min": "OwnerName must be at least 2 characters",
    "string.empty": "OwnerName is required",
    "any.required": "OwnerName is required",
  }),
  ownerMobile: Joi.string().trim().min(10).required().messages({
    "string.min": "OwnerMobile must be at least 10 characters",
    "string.empty": "OwnerMobile is required",
    "any.required": "OwnerMobile is required",
  }),

  password: Joi.string().trim().min(4).required().messages({
    "string.min": "Password must be at least 8 characters",
    "string.empty": "Password is required",
    "any.required": "Password is required",
  }),
}).strict();

export const loginApartmentSchema = Joi.object({
  apartmentId: Joi.string().trim().required().messages({
    "string.empty": "ApartmentId is required",
    "any.required": "ApartmentId is required",
  }),

  password: Joi.string().trim().min(4).required().messages({
    "string.min": "Password must be at least 8 characters",
    "string.empty": "Password is required",
    "any.required": "Password is required",
  }),
}).strict();
