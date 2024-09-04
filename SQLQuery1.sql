-- Create the satellite_images table
CREATE TABLE satellite_images (
    image_id SERIAL PRIMARY KEY,
    image_date DATE NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    processed BOOL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE hyacinth_distribution (
    distribution_id SERIAL PRIMARY KEY,
    image_id INT NOT NULL,
    hyacinth_area FLOAT NOT NULL,
    hyacinth_density FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_image
        FOREIGN KEY(image_id) 
        REFERENCES satellite_images(image_id)
        ON DELETE CASCADE
);

-- 
CREATE TABLE image_processing_results (
    processing_id SERIAL PRIMARY KEY,
    image_id INT NOT NULL,
    algorithm VARCHAR(255) NOT NULL,
    processing_time FLOAT NOT NULL,
    accuracy FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_image_processing
        FOREIGN KEY(image_id) 
        REFERENCES satellite_images(image_id)
        ON DELETE CASCADE
);


CREATE TABLE ml_model_outcomes (
    outcome_id SERIAL PRIMARY KEY,
    image_id INT NOT NULL,
    model_name VARCHAR(255) NOT NULL,
    prediction VARCHAR(255) NOT NULL,
    confidence FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_image_outcome
        FOREIGN KEY(image_id) 
        REFERENCES satellite_images(image_id)
        ON DELETE CASCADE
);

-- 
CREATE INDEX idx_image_date ON satellite_images(image_date);
CREATE INDEX idx_hyacinth_area ON hyacinth_distribution(hyacinth_area);
CREATE INDEX idx_algorithm ON image_processing_results(algorithm);
CREATE INDEX idx_model_name ON ml_model_outcomes(model_name);
